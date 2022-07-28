; Auto-generated. Do not edit!


(cl:in-package yaml_service-srv)


;//! \htmlinclude readTagPos-request.msg.html

(cl:defclass <readTagPos-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0))
)

(cl:defclass readTagPos-request (<readTagPos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <readTagPos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'readTagPos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yaml_service-srv:<readTagPos-request> is deprecated: use yaml_service-srv:readTagPos-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <readTagPos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yaml_service-srv:id-val is deprecated.  Use yaml_service-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <readTagPos-request>) ostream)
  "Serializes a message object of type '<readTagPos-request>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <readTagPos-request>) istream)
  "Deserializes a message object of type '<readTagPos-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<readTagPos-request>)))
  "Returns string type for a service object of type '<readTagPos-request>"
  "yaml_service/readTagPosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'readTagPos-request)))
  "Returns string type for a service object of type 'readTagPos-request"
  "yaml_service/readTagPosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<readTagPos-request>)))
  "Returns md5sum for a message object of type '<readTagPos-request>"
  "764aca2dfd32df67158193ad05a67c51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'readTagPos-request)))
  "Returns md5sum for a message object of type 'readTagPos-request"
  "764aca2dfd32df67158193ad05a67c51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<readTagPos-request>)))
  "Returns full string definition for message of type '<readTagPos-request>"
  (cl:format cl:nil "int64 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'readTagPos-request)))
  "Returns full string definition for message of type 'readTagPos-request"
  (cl:format cl:nil "int64 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <readTagPos-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <readTagPos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'readTagPos-request
    (cl:cons ':id (id msg))
))
;//! \htmlinclude readTagPos-response.msg.html

(cl:defclass <readTagPos-response> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0))
)

(cl:defclass readTagPos-response (<readTagPos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <readTagPos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'readTagPos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yaml_service-srv:<readTagPos-response> is deprecated: use yaml_service-srv:readTagPos-response instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <readTagPos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yaml_service-srv:x-val is deprecated.  Use yaml_service-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <readTagPos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yaml_service-srv:y-val is deprecated.  Use yaml_service-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <readTagPos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yaml_service-srv:z-val is deprecated.  Use yaml_service-srv:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <readTagPos-response>) ostream)
  "Serializes a message object of type '<readTagPos-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <readTagPos-response>) istream)
  "Deserializes a message object of type '<readTagPos-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<readTagPos-response>)))
  "Returns string type for a service object of type '<readTagPos-response>"
  "yaml_service/readTagPosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'readTagPos-response)))
  "Returns string type for a service object of type 'readTagPos-response"
  "yaml_service/readTagPosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<readTagPos-response>)))
  "Returns md5sum for a message object of type '<readTagPos-response>"
  "764aca2dfd32df67158193ad05a67c51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'readTagPos-response)))
  "Returns md5sum for a message object of type 'readTagPos-response"
  "764aca2dfd32df67158193ad05a67c51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<readTagPos-response>)))
  "Returns full string definition for message of type '<readTagPos-response>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'readTagPos-response)))
  "Returns full string definition for message of type 'readTagPos-response"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <readTagPos-response>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <readTagPos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'readTagPos-response
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'readTagPos)))
  'readTagPos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'readTagPos)))
  'readTagPos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'readTagPos)))
  "Returns string type for a service object of type '<readTagPos>"
  "yaml_service/readTagPos")