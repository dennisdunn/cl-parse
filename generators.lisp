;;;; cl-parse.lisp

(in-package #:cl-tiny-parse)

(defun str (str)
    "Matches if the stream starts with str."
  (lambda (stream)
    (if (string= (peek stream (length str)) str)
        (values (read stream (length str)))
        nil)))

(defun any-of-char (chars)
    "Matches if the next character of stream is in chars."
  (lambda (stream)
    (if (search (peek stream) chars)
        (values (read stream))
        nil)))
