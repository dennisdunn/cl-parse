;;;; cl-parse.lisp

(in-package #:cl-tiny-parse)

(defun str (str)
  (lambda (stream)
    (if (string= (peek stream (length str)) str)
        (values (read stream (length str)))
        nil)))

(defun any-of-char (chars)
  (lambda (stream)
    (if (search (peek stream) chars)
        (values (read stream))
        nil)))
