(in-package #:cl-tiny-parse)

(defclass parser-stream ()
    ((source :initarg :source
             :initform (error ":source is required")
             :reader source)
     (index :initform 0
            :accessor index)))

(defmethod peek ((stream parser-stream) &optional (len 1))
    "Get the next len characters from the stream but don't advance the index."
  (let* ((start (index stream))
         (end (+ start len)))
    (values
      (subseq (source stream) start end)
      end)))

(defmethod read ((stream parser-stream) &optional (len 1))
    "Get the next len characters from the stream and advance the stream index."
  (multiple-value-bind (result idx) (peek stream len)
    (seek stream idx)
    (values result idx)))

(defmethod seek ((stream parser-stream) position)
    "Set the streams index to the provided position."
    (setf (index stream) position))

(defmethod reset ((stream parser-stream))
    "Set the streams index to the beguinning of the source."
    (seek stream 0))
