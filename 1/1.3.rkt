#lang sicp
(define (max x y z)
  (cond
    [(and (>= y x) (>= z x)) (+ y z)]
    [(and (>= x y) (>= z y)) (+ x z)]
    [else (+ x y)]))