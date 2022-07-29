 #!/usr/bin/env python2
 
import rospy
from yaml_service.srv import *

def passTagID_client(id):
    rospy.wait_for_service('read_tag_pos')
    try:
        read_tag_pos = rospy.ServiceProxy('read_tag_pos', readTagPos)
        resp = read_tag_pos(id)
        return resp
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

if __name__ == "__main__":
    print(passTagID_client(6))


