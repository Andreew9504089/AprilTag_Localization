# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yaml_service: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yaml_service_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv" NAME_WE)
add_custom_target(_yaml_service_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yaml_service" "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(yaml_service
  "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yaml_service
)

### Generating Module File
_generate_module_cpp(yaml_service
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yaml_service
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yaml_service_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yaml_service_generate_messages yaml_service_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv" NAME_WE)
add_dependencies(yaml_service_generate_messages_cpp _yaml_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yaml_service_gencpp)
add_dependencies(yaml_service_gencpp yaml_service_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yaml_service_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(yaml_service
  "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yaml_service
)

### Generating Module File
_generate_module_eus(yaml_service
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yaml_service
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yaml_service_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yaml_service_generate_messages yaml_service_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv" NAME_WE)
add_dependencies(yaml_service_generate_messages_eus _yaml_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yaml_service_geneus)
add_dependencies(yaml_service_geneus yaml_service_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yaml_service_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(yaml_service
  "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yaml_service
)

### Generating Module File
_generate_module_lisp(yaml_service
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yaml_service
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yaml_service_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yaml_service_generate_messages yaml_service_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv" NAME_WE)
add_dependencies(yaml_service_generate_messages_lisp _yaml_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yaml_service_genlisp)
add_dependencies(yaml_service_genlisp yaml_service_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yaml_service_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(yaml_service
  "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yaml_service
)

### Generating Module File
_generate_module_nodejs(yaml_service
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yaml_service
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yaml_service_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yaml_service_generate_messages yaml_service_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv" NAME_WE)
add_dependencies(yaml_service_generate_messages_nodejs _yaml_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yaml_service_gennodejs)
add_dependencies(yaml_service_gennodejs yaml_service_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yaml_service_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(yaml_service
  "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yaml_service
)

### Generating Module File
_generate_module_py(yaml_service
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yaml_service
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yaml_service_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yaml_service_generate_messages yaml_service_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/NCRL/AprilTag_Localization/src/Env/yaml_service/srv/readTagPos.srv" NAME_WE)
add_dependencies(yaml_service_generate_messages_py _yaml_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yaml_service_genpy)
add_dependencies(yaml_service_genpy yaml_service_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yaml_service_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yaml_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yaml_service
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yaml_service_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yaml_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yaml_service
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yaml_service_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yaml_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yaml_service
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yaml_service_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yaml_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yaml_service
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yaml_service_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yaml_service)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yaml_service\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yaml_service
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yaml_service_generate_messages_py std_msgs_generate_messages_py)
endif()
