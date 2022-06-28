# Install script for directory: /home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation

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
  include("/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/installspace/rotors_evaluation.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_evaluation/cmake" TYPE FILE FILES
    "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/installspace/rotors_evaluationConfig.cmake"
    "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/installspace/rotors_evaluationConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rotors_evaluation" TYPE FILE FILES "/home/andrew/NCRL/AprilTag_Localization/src/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/rotors_evaluation" TYPE PROGRAM FILES "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/installspace/disturbance_eval.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/rotors_evaluation" TYPE PROGRAM FILES "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/installspace/hovering_eval.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/rotors_evaluation" TYPE PROGRAM FILES "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/installspace/waypoints_eval.py")
endif()

