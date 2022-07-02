#lang racket
(define (cube-root x)
  (define (pow x n)
    (if (= n 1)
        x
        (* x (pow x (- n 1)))))
  (define (good-enough? guess x)
    (< (abs (- (pow guess 3) x)) (/ x 1000)))
  (define (improve guess x)
    (/ (+ (/ x (pow guess 2)) (* 2 guess)) 3))
  (define (cube-root-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-root-iter (improve guess x) x)))
  (cube-root-iter 1.0 x))