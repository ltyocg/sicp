#lang sicp
(define (no-more? coin-values)
  (null? coin-values))
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (cc amount coin-values)
  (cond
    ((zero? amount) 1)
    ((or (< amount 0) (no-more? coin-values)) 0)
    (else
     (+ (cc (- amount (first-denomination coin-values)) coin-values)
        (cc amount (except-first-denomination coin-values))))))