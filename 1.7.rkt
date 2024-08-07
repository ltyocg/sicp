#lang sicp
(define (square x) (* x x))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (/ x 1000)))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))