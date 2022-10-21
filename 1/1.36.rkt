#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (< (abs (- guess next)) tolerance)
          next
          (try next))))
  (try first-guess))
(fixed-point (lambda (x) (/ (log 1000) (log x))) 5)