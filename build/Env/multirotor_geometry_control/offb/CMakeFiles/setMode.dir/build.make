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

# Include any dependencies generated for this target.
include Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/depend.make

# Include the progress variables for this target.
include Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/progress.make

# Include the compile flags for this target's objects.
include Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/flags.make

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o: Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/flags.make
Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o: /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/offb/src/setMode.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/andrew/NCRL/AprilTag_Localization/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o"
	cd /home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/offb && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/setMode.dir/src/setMode.cpp.o -c /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/offb/src/setMode.cpp

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/setMode.dir/src/setMode.cpp.i"
	cd /home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/offb && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/offb/src/setMode.cpp > CMakeFiles/setMode.dir/src/setMode.cpp.i

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/setMode.dir/src/setMode.cpp.s"
	cd /home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/offb && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/offb/src/setMode.cpp -o CMakeFiles/setMode.dir/src/setMode.cpp.s

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.requires:

.PHONY : Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.requires

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.provides: Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.requires
	$(MAKE) -f Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/build.make Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.provides.build
.PHONY : Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.provides

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.provides.build: Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o


# Object files for target setMode
setMode_OBJECTS = \
"CMakeFiles/setMode.dir/src/setMode.cpp.o"

# External object files for target setMode
setMode_EXTERNAL_OBJECTS =

/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/build.make
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libgazebo_ros_api_plugin.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libgazebo_ros_paths_plugin.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libtf.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libmavros.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libGeographic.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libdiagnostic_updater.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libeigen_conversions.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/liborocos-kdl.so.1.4.0
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libmavconn.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libclass_loader.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/libPocoFoundation.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libdl.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libroslib.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/librospack.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libtf2_ros.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libactionlib.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libmessage_filters.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libroscpp.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/librosconsole.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libtf2.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/librostime.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /opt/ros/melodic/lib/libcpp_common.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode: Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/andrew/NCRL/AprilTag_Localization/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode"
	cd /home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/offb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/setMode.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/build: /home/andrew/NCRL/AprilTag_Localization/devel/lib/offb/setMode

.PHONY : Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/build

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/requires: Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/src/setMode.cpp.o.requires

.PHONY : Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/requires

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/clean:
	cd /home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/offb && $(CMAKE_COMMAND) -P CMakeFiles/setMode.dir/cmake_clean.cmake
.PHONY : Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/clean

Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/depend:
	cd /home/andrew/NCRL/AprilTag_Localization/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andrew/NCRL/AprilTag_Localization/src /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/offb /home/andrew/NCRL/AprilTag_Localization/build /home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/offb /home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Env/multirotor_geometry_control/offb/CMakeFiles/setMode.dir/depend

