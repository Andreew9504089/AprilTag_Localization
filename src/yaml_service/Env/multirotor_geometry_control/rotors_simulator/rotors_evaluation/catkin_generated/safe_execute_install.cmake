execute_process(COMMAND "/home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/andrew/NCRL/AprilTag_Localization/src/yaml_service/Env/multirotor_geometry_control/rotors_simulator/rotors_evaluation/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
