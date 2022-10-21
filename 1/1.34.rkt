#lang sicp
(define (f g) (g 2))
; 4
(f (lambda (x) (* x x)))
; 6
(f (lambda (z) (* z (inc z))))
(f f)