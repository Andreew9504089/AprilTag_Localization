#!/usr/bin/env python
import numpy as np
import cv2
import math
import rospy
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point, Pose
from std_msgs.msg import Int8, Float32
import tf
from cv_bridge import CvBridge, CvBridgeError

class TargetDetector():
    def __init__(self, kp = 0.4, ki = 0.001, kd = 0.3):
        self.t = 0
        self.target_brightness = 0
        self.err_x = 0
        self.err_y = 0
        self.error = 0
        self.last_ex = 0
        self.last_ey = 0
        self.acc_ex = 0
        self.acc_ey = 0
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.img = ''
        self.bridge = CvBridge()
        self.imageSub = rospy.Subscriber("camera_firefly/image_raw", Image, self.cameraCallback)
        self.mode_Sub = rospy.Subscriber("mode", Int8, self.modeCallback)
        self.mode_pub = rospy.Publisher('mode', Int8, queue_size=1)
        self.mode = 0
        self.compensator = PositionCompensator()

    def modeCallback(self, msg):
        self.mode = msg

    def cameraCallback(self, data):
        try:
            self.img = self.bridge.imgmsg_to_cv2(data, "bgr8")
            self.detect()

        except CvBridgeError as e:
            rospy.logerr(e)
    
    def detect(self):
        img = self.img.copy()

        # The range of red region has to be further fine-tuned
        lower_red = np.array([0, 0, 100])
        upper_red = np.array([50, 50, 255])

        mask = cv2.inRange(img, lower_red, upper_red)
        
        kernel = np.ones((3,3), np.uint8)
        mask = cv2.erode(mask, kernel, iterations = 1)
        mask = cv2.dilate(mask, kernel, iterations = 1)

        kernel = np.ones((3,3), np.uint8)
        mask = cv2.dilate(mask, kernel, iterations = 1)
        mask = cv2.erode(mask, kernel, iterations = 1)


        res = cv2.bitwise_and(img, img, mask=mask)
        #cv2.imshow("res", bgr) 

        contours, hierarchy = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        text = "No Target Found!"
        if len(contours) > 0 :
            c = max(contours, key=cv2.contourArea)
            cv2.drawContours(img, contours, -1, (0,255,0), 3)

            min_x = c[c[:,:,0].argmin()][0][0]
            max_x = c[c[:,:,0].argmax()][0][0]
            min_y = c[c[:,:,1].argmin()][0][1]
            max_y = c[c[:,:,1].argmax()][0][1]
            y = int((min_y + max_y) / 2)
            x = int((min_x + max_x) / 2)

            target_center = (x, y)
            origin = (int(img.shape[1]/2), int(img.shape[0]/2))

            cv2.line(img, (0,y), (img.shape[1],y), (255,255,0),2)
            cv2.line(img, (x,0), (x,img.shape[0]), (255,255,0),2)

            self.err_x = origin[1] - y
            self.err_y = origin[0] - x
            self.acc_ex += self.err_x
            self.acc_ey += self.err_y
            diff_x = self.err_x - self.last_ex
            diff_y = self.err_y - self.last_ey
            self.wx = self.kp*(self.err_x) + self.ki*(self.acc_ex) + self.kd*(diff_x)
            self.wy = self.kp*(self.err_y) + self.ki*(self.acc_ey) + self.kd*(diff_y)
            self.error = np.sqrt(self.err_y ** 2 + self.err_x ** 2)

            text1 = "Target Found!"
            text2 = "Error(pixel): " + str(np.round((self.error),2))
            cv2.putText(img, text1, (25, 25), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 1, cv2.LINE_AA)
            cv2.putText(img, text2, (25, 45), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 1, cv2.LINE_AA)

            if self.error >= 50:
                target_pos = self.compensator.computeTargetPos(self.wx, self.wy, 1)

                if self.mode.data != 0:
                    print('mode', self.mode)
                    self.mode_pub.publish(Int8(4))

            target_pos = self.compensator.computeTargetPos(self.err_x, self.err_y, 0)
            text = "Target Pos: [{0} {1} {2}]".format(str(target_pos[0]), str(target_pos[1]), str(target_pos[2]))
            cv2.putText(img, text, (25, 65), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 1, cv2.LINE_AA)

        else:
            cv2.putText(img, text, (25, 25), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 0, 255), 1, cv2.LINE_AA)
            if self.t % 30 == 0:
                rospy.loginfo('Target Not Found!')

        s = rospy.get_namespace()
        cv2.imshow(s+"camera", img)
        cv2.waitKey(1)
        self.t += 1
        

class PositionCompensator():
    def __init__(self):
        self.position_Pub = rospy.Publisher('/target_pos', Point, queue_size=1)
        self.track_Pub = rospy.Publisher('/track_pos', Point, queue_size=1)
        self.UAV_pos_Sub = rospy.Subscriber("odometry_sensor1/pose", Pose, self.UAV_pose_Callback)
        self.UAV_pose = Pose()
        self.focal_length = 0.381
        self.tick = 0

    def UAV_pose_Callback(self, data):
        self.UAV_pose = data
    
    def vector_body2world(self, v):
        orientation = [self.UAV_pose.orientation.x, self.UAV_pose.orientation.y, self.UAV_pose.orientation.z, self.UAV_pose.orientation.w]
        q1 = tf.transformations.quaternion_conjugate(orientation)
        q2 = list(v)
        q2.append(0.0)
        return tf.transformations.quaternion_multiply(
            tf.transformations.quaternion_multiply(q1, q2), 
            tf.transformations.quaternion_conjugate(q1)
        )[:3]

    def computeTargetPos(self, err_x, err_y, flag):
        if flag == 1:
            err_x = (err_x/self.focal_length*(self.UAV_pose.position.z - 1 + self.focal_length))/1000
            err_y = (err_y/self.focal_length*(self.UAV_pose.position.z - 1 + self.focal_length))/1000
            v = [err_x, err_y, 0]
            v_world = self.vector_body2world(v)
            position = [self.UAV_pose.position.x, self.UAV_pose.position.y, self.UAV_pose.position.z]
            target_pos = (position + v_world)
            target_pos = Point(target_pos[0], target_pos[1], target_pos[2])
            self.track_Pub.publish(target_pos)
            
            if self.tick  == 10:
                rospy.loginfo('Target Found at \nx: %s\ny: %s\nz: %s', str(target_pos.x), str(target_pos.y), str(target_pos.z))
                self.tick = 0
            self.tick+=1

        elif flag == 0:
            err_x = (err_x/self.focal_length*(self.UAV_pose.position.z - 1 + self.focal_length))/1000
            err_y = (err_y/self.focal_length*(self.UAV_pose.position.z - 1 + self.focal_length))/1000
            v = [err_x, err_y, 0]
            v_world = self.vector_body2world(v)
            position = [self.UAV_pose.position.x, self.UAV_pose.position.y, self.UAV_pose.position.z]
            target_pos = (position + v_world)
            target_pos = Point(target_pos[0], target_pos[1], target_pos[2])
            self.position_Pub.publish(target_pos)

        return [np.round(target_pos.x,2), np.round(target_pos.y,2), np.round(target_pos.z,2)]


if __name__ == '__main__':
    rospy.init_node('detector', anonymous=True)
    t = 0
    target_brightness = 0
    rate = rospy.Rate(10)

    rospy.loginfo('Start searching for target...')
    detector = TargetDetector()
    rospy.spin()


