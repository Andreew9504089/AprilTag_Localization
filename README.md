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
$ roslaunch rotors_gazebo iris_one.launch
```
## Group Members

## To-Do
:heavy_check_mark: Mount 2 D435 cameras <br>
<img src="https://github.com/Andreew9504089/AprilTag_Localization/blob/master/firefly1wD435.PNG" width="250" height="200" />

:heavy_check_mark: Add 2 AprilTags in Gazebo <br>
<img src="https://github.com/Andreew9504089/AprilTag_Localization/blob/master/Screenshot%20from%202022-06-29%2011-23-14.png" width="500" height="200" />

- [ ] Tuning error of camera and Apriltags

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
