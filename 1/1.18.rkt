#lang sicp
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (* a b)
  (define (iter a b s)
    (cond ((= b 0) s)
          ((even? b) (iter (double a) (halve b) s))
          (else (iter a (dec b) (+ s a)))))
  (iter a b 0))