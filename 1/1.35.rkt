#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (< (abs (- guess next)) tolerance)
          next
          (try next))))
  (try first-guess))
(fixed-point (lambda (x) (inc (/ 1 x))) 1.618)