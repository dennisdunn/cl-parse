;;;; cl-parse.lisp

(in-package #:cl-tiny-parse)

(defun make-parser (str)
  (lambda (stream)
    (if (string= (peek-stream stream (length  str)) str)
        (values (read-stream stream (length  str)))
        nil)))
