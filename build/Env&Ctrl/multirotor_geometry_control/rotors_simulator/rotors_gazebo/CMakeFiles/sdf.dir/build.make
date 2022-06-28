# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/andrew/NCRL/AprilTag_Localization/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/andrew/NCRL/AprilTag_Localization/build

# Utility rule file for sdf.

# Include the progress variables for this target.
include Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/progress.make

Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf: /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf


/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf: /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris.xacro
/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf: /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.xacro
/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf: /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/component_snippets.xacro
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/andrew/NCRL/AprilTag_Localization/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf"
	cd "/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo" && rm -f /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf
	cd "/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo" && python /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/scripts/xacro.py -o /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.urdf /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.xacro enable_mavlink_interface:=true enable_ground_truth:=false enable_wind:=false enable_logging:=false rotors_description_dir:=/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description
	cd "/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo" && gz sdf -p /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.urdf >> /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf
	cd "/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo" && rm -f /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.urdf

sdf: Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf
sdf: /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/models/iris/iris.sdf
sdf: Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/build.make

.PHONY : sdf

# Rule to build all files generated by this target.
Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/build: sdf

.PHONY : Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/build

Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/clean:
	cd "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo" && $(CMAKE_COMMAND) -P CMakeFiles/sdf.dir/cmake_clean.cmake
.PHONY : Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/clean

Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/depend:
	cd /home/andrew/NCRL/AprilTag_Localization/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andrew/NCRL/AprilTag_Localization/src "/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo" /home/andrew/NCRL/AprilTag_Localization/build "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo" "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/depend

