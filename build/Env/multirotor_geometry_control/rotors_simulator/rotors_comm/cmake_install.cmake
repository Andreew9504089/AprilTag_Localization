# Install script for directory: /home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_comm

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/andrew/NCRL/AprilTag_Localization/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_comm/srv" TYPE FILE FILES
    "/home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/srv/Octomap.srv"
    "/home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/srv/RecordRosbag.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_comm/msg" TYPE FILE FILES "/home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/msg/WindSpeed.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_comm/cmake" TYPE FILE FILES "/home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/catkin_generated/installspace/rotors_comm-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/andrew/NCRL/AprilTag_Localization/devel/include/rotors_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/andrew/NCRL/AprilTag_Localization/devel/share/roseus/ros/rotors_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/andrew/NCRL/AprilTag_Localization/devel/share/common-lisp/ros/rotors_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/andrew/NCRL/AprilTag_Localization/devel/share/gennodejs/ros/rotors_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/andrew/NCRL/AprilTag_Localization/devel/lib/python2.7/dist-packages/rotors_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/andrew/NCRL/AprilTag_Localization/devel/lib/python2.7/dist-packages/rotors_comm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/catkin_generated/installspace/rotors_comm.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_comm/cmake" TYPE FILE FILES "/home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/catkin_generated/installspace/rotors_comm-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_comm/cmake" TYPE FILE FILES
    "/home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/catkin_generated/installspace/rotors_commConfig.cmake"
    "/home/andrew/NCRL/AprilTag_Localization/build/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/catkin_generated/installspace/rotors_commConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_comm" TYPE FILE FILES "/home/andrew/NCRL/AprilTag_Localization/src/Env/multirotor_geometry_control/rotors_simulator/rotors_comm/package.xml")
endif()

