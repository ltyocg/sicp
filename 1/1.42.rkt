#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))
; 49
((compose (lambda (x) (* x x)) inc) 6)