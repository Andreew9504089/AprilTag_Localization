execute_process(COMMAND "/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rqt_rotors/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/andrew/NCRL/AprilTag_Localization/build/Env&Ctrl/multirotor_geometry_control/rotors_simulator/rqt_rotors/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
