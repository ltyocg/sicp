#lang sicp
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (dec count))))
  (fib-iter 1 0 n))