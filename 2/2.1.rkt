#lang sicp
(define (make-rat n d)
  (let ([g (gcd n d)])
    (cons
     ((if (negative? (/ n d)) - +) (abs (/ n g)))
     (abs (/ d g)))))