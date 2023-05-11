(in-package #:cl-parse)

(defun any-of (&rest parsers)
    "Return the value of the first successful parser or nil if the parse fails."
  (lambda (stream)
    (dolist (parser parsers)
      (let ((result (funcall parser stream)))
        (if result (return result))))))

(defun all-of (&rest parsers)
    "Return the concatenated values of the parsers or nil if the parse fails."
  (lambda (stream)
    (let* ((start (index stream))
           (values (mapcar #'(lambda (parser) (funcall parser stream)) parsers)))
      (if (reduce #'(lambda (a b) (and a b)) values :initial-value t)
          (reduce #'(lambda (a b) (concatenate 'string a b)) values :initial-value "")
          (progn (seek-stream stream start)
                 nil)))))