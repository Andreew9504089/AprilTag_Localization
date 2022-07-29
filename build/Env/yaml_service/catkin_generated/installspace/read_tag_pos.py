#!/usr/bin/env python2
 
import yaml
import rospy
from yaml_service.srv import readTagPos, readTagPosResponse

with open("/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/config/poses.yaml") as f:
    data = yaml.load(f)
    tags_list = data['bodies'][0]['test_room']['tags']

def readTagPosition(req):
    resp = readTagPosResponse()
    for dct in tags_list:
        if dct['id'] == req.id:	
            resp.x = dct['pose']['position']['x']
            resp.y = dct['pose']['position']['y']
            resp.z = dct['pose']['position']['z']
        
    return resp

def readTagPosition_server():
    rospy.init_node("read_tag_pos_server")
    s = rospy.Service('read_tag_pos', readTagPos, readTagPosition)
    print("Ready to read tag pos")
    rospy.spin()

if __name__ == "__main__":
    readTagPosition_server()

