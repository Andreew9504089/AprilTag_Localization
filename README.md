# UAV Localization within warehouse using multiple AprilTags

## Installation
```console
$ mkdir -p ~/yourwsname
$ git clone https://github.com/Andreew9504089/AprilTag_Localization.git
$ cd ~/yourwsname
$ catkin_make
```

## Run
```console
$ cd [pathToWorkspace]
$ source devel/setup.bash

====For Gazebo Simulation====
$ export GAZEBO_MODEL_PATH=[path to Apriltag_Localization]/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models:$GAZEBO_MODEL_PATH
$ roslaunch rotors_gazebo iris_one.launch
$ roslaunch rotors_gazebo controller_geometry_iris.launch

====For Localization====
$ roslaunch apriltag_ros continuous_detection.launch
$ rosrun yaml_service read_tag_pos.py
$ rosrun rotors_gazebo imu_coord_enu
$ rosrun rotors_gazebo Error_C_OOP_ver2
$ rosrun imu_filter_madgwick imu_filter_node _use_mag:=false _publish_tf:=false _world_frame:="enu" /imu/data_raw:=/iris1/imu/enu
$ roslaunch rotors_gazebo apriltag_localization_sensor_fusion.launch

```
## Group Members

## To-Do
:heavy_check_mark: Mount 2 D435 cameras <br>
<img src="https://github.com/Andreew9504089/AprilTag_Localization/blob/master/firefly1wD435.PNG" width="250" height="200" />

:heavy_check_mark: Add 2 AprilTags in Gazebo <br>
<img src="https://github.com/Andreew9504089/AprilTag_Localization/blob/master/Screenshot%20from%202022-06-30%2009-54-42.png" width="300" height="250" />

:heavy_check_mark: Error of camera and Apriltags
* Using RGB image
    * Downward Error Table
    
        Error = (uav GT z position - 0.05) - (/tag_detections z position + 0.01)
        | Height | 0.8m  | 1.4m  | 2m  |  3m  |
        | ------ | ----- | ----- | --- | ---  |
        | Error  | 0.046m | 0.046m |   0.042m  |   0.017m   |

    * Forward Error Table

        Error = tag GT x position - (uav GT x position + 0.1 + /tag_detection z position)
        | Height | 0.8m   | 1.4m   | 2m     | 3m    |
        | ------ | ------ | ------ | ------ | --- |
        | Error  | 0.008m | 0.005m | 0.007m | 0.001m |


## Tutorials
### How to add Apriltags in Gazebo
* **Objectives:**<br>
&emsp; Insert Apriltag as model with apriltag textures in Gazebo with size of 0.3m x 0.3m

1. Change directory to /src/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models
2. Copy the desired Apriltag .png image file to media/materials/textures
3. Add the material in media/materials/scripts/Apriltag.material by copying the same as above and modify the texture to your desired image
4. Find 0.3mSquarePlate template in /models and copy
5. Change the name in model.config and model.sdf to ApriltagIDx
6. In model.sdf find <name> tag under <material> tag, then change the name to Apriltag/IDx
