;; Auto-generated. Do not edit!


(when (boundp 'yaml_service::readTagPos)
  (if (not (find-package "YAML_SERVICE"))
    (make-package "YAML_SERVICE"))
  (shadow 'readTagPos (find-package "YAML_SERVICE")))
(unless (find-package "YAML_SERVICE::READTAGPOS")
  (make-package "YAML_SERVICE::READTAGPOS"))
(unless (find-package "YAML_SERVICE::READTAGPOSREQUEST")
  (make-package "YAML_SERVICE::READTAGPOSREQUEST"))
(unless (find-package "YAML_SERVICE::READTAGPOSRESPONSE")
  (make-package "YAML_SERVICE::READTAGPOSRESPONSE"))

(in-package "ROS")





(defclass yaml_service::readTagPosRequest
  :super ros::object
  :slots (_id ))

(defmethod yaml_service::readTagPosRequest
  (:init
   (&key
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; int64 _id
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _id
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass yaml_service::readTagPosResponse
  :super ros::object
  :slots (_x _y _z ))

(defmethod yaml_service::readTagPosResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass yaml_service::readTagPos
  :super ros::object
  :slots ())

(setf (get yaml_service::readTagPos :md5sum-) "764aca2dfd32df67158193ad05a67c51")
(setf (get yaml_service::readTagPos :datatype-) "yaml_service/readTagPos")
(setf (get yaml_service::readTagPos :request) yaml_service::readTagPosRequest)
(setf (get yaml_service::readTagPos :response) yaml_service::readTagPosResponse)

(defmethod yaml_service::readTagPosRequest
  (:response () (instance yaml_service::readTagPosResponse :init)))

(setf (get yaml_service::readTagPosRequest :md5sum-) "764aca2dfd32df67158193ad05a67c51")
(setf (get yaml_service::readTagPosRequest :datatype-) "yaml_service/readTagPosRequest")
(setf (get yaml_service::readTagPosRequest :definition-)
      "int64 id
---
float32 x
float32 y
float32 z

")

(setf (get yaml_service::readTagPosResponse :md5sum-) "764aca2dfd32df67158193ad05a67c51")
(setf (get yaml_service::readTagPosResponse :datatype-) "yaml_service/readTagPosResponse")
(setf (get yaml_service::readTagPosResponse :definition-)
      "int64 id
---
float32 x
float32 y
float32 z

")



(provide :yaml_service/readTagPos "764aca2dfd32df67158193ad05a67c51")


