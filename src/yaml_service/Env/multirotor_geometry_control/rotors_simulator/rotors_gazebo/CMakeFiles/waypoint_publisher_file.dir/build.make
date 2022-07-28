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
CMAKE_BINARY_DIR = /home/andrew/NCRL/AprilTag_Localization/src/yaml_service

# Include any dependencies generated for this target.
include Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/depend.make

# Include the progress variables for this target.
include Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/progress.make

# Include the compile flags for this target's objects.
include Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/flags.make

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o: Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/flags.make
Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o: ../Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/src/waypoint_publisher_file.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/andrew/NCRL/AprilTag_Localization/src/yaml_service/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o"
	cd /home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o -c /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/src/waypoint_publisher_file.cpp

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.i"
	cd /home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/src/waypoint_publisher_file.cpp > CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.i

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.s"
	cd /home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/src/waypoint_publisher_file.cpp -o CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.s

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.requires:

.PHONY : Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.requires

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.provides: Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.requires
	$(MAKE) -f Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/build.make Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.provides.build
.PHONY : Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.provides

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.provides.build: Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o


# Object files for target waypoint_publisher_file
waypoint_publisher_file_OBJECTS = \
"CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o"

# External object files for target waypoint_publisher_file
waypoint_publisher_file_EXTERNAL_OBJECTS =

devel/lib/rotors_gazebo/waypoint_publisher_file: Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o
devel/lib/rotors_gazebo/waypoint_publisher_file: Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/build.make
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/libroscpp.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/librosconsole.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/librosconsole_log4cxx.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/librosconsole_backend_interface.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libboost_regex.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/libxmlrpcpp.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/libroscpp_serialization.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/librostime.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /opt/ros/melodic/lib/libcpp_common.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libboost_system.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libboost_thread.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libpthread.so
devel/lib/rotors_gazebo/waypoint_publisher_file: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
devel/lib/rotors_gazebo/waypoint_publisher_file: Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/andrew/NCRL/AprilTag_Localization/src/yaml_service/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../devel/lib/rotors_gazebo/waypoint_publisher_file"
	cd /home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/waypoint_publisher_file.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/build: devel/lib/rotors_gazebo/waypoint_publisher_file

.PHONY : Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/build

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/requires: Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/src/waypoint_publisher_file.cpp.o.requires

.PHONY : Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/requires

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/clean:
	cd /home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo && $(CMAKE_COMMAND) -P CMakeFiles/waypoint_publisher_file.dir/cmake_clean.cmake
.PHONY : Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/clean

Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/depend:
	cd /home/andrew/NCRL/AprilTag_Localization/src/yaml_service && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andrew/NCRL/AprilTag_Localization/src /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo /home/andrew/NCRL/AprilTag_Localization/src/yaml_service /home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo /home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Env/multirotor_geometry_control/rotors_simulator/rotors_gazebo/CMakeFiles/waypoint_publisher_file.dir/depend

