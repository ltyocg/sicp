#lang sicp
(define (no-more? coin-values)
  (zero? (length coin-values)))
(define (first-denomination coin-values)
  (cdr coin-values))
(define (cc amount coin-values)
  (cond
    ((zero? amount) 1)
    ((or (< amount 0) (no-more? coin-values)) 0)
    (else
     (+ (cc amount
            (except-first-denomination coin-values))
        (cc (- amount (first-denomination coin-values))
            coin-values)))))