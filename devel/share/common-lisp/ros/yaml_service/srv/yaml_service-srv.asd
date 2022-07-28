
(cl:in-package :asdf)

(defsystem "yaml_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "readTagPos" :depends-on ("_package_readTagPos"))
    (:file "_package_readTagPos" :depends-on ("_package"))
  ))