 #!/usr/bin/env python2
 
import yaml
import rospy
from yaml_service.srv import readTagPos, readTagPosResponse

with open('../config/poses.yaml') as f:
    data = yaml.load(f)
    tags_list = data['bodies'][0]['test_room']['tags']

def readTagPosition(req):
    resp = readTagPosResponse()
    resp.x = tags_list['id' == req.id]['pose']['position']['x']
    resp.y = tags_list['id' == req.id]['pose']['position']['y']
    resp.z = tags_list['id' == req.id]['pose']['position']['z']
    return resp

def readTagPosition_server():
    rospy.init_node("read_tag_pos_server")
    s = rospy.Service('read_tag_pos', readTagPos, readTagPosition)
    print("Ready to read tag pos")
    rospy.spin()

if __name__ == "__main__":
    readTagPosition_server()

