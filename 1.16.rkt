#lang sicp
(define (fast-expt b n)
  (define (square x) (* x x))
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (/ n 2) a))
          (else (iter b (dec n) (* a b)))))
  (iter b n 1))