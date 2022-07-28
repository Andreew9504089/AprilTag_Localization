#include <iostream>
#include "yaml-cpp/yaml.h"

int main()
{
    YAML::Node tag_pose_config = YAML::LoadFile("/home/.ros/poses.yaml");
}