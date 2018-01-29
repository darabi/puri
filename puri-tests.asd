;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;;; Programmer: Kevin Rosenberg


(in-package #:cl-user)
(defpackage #:puri-system (:use #:cl #:asdf))
(in-package #:puri-system)

(defsystem puri-tests
    :depends-on (:puri :ptester)
    :components
    ((:file "tests")))

(defmethod perform ((o test-op) (c (eql (find-system 'puri-tests))))
  (or (funcall (intern (symbol-name '#:do-tests)
                       (find-package :puri-tests)))
      (error "test-op failed")))

(defmethod operation-done-p ((o test-op) (c (eql (find-system 'puri-tests))))
  (values nil))
