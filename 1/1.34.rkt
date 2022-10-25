#lang sicp
(define (f g) (g 2))
(f (lambda (x) (* x x)))
; 4
(f (lambda (z) (* z (inc z))))
; 6
(f f)