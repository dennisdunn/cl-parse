;;;; cl-parse.asd

(asdf:defsystem #:cl-tiny-parse
  :description "A simple parser combinator library."
  :author "Dennis Dunn <ansofive@gmail.com>"
  :license  "See LICENSE in the repository."
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "stream")
               (:file "generators")
               (:file "combinators")))
