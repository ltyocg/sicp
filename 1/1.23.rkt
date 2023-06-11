#lang sicp
(define (prime? n)
  (define (smallest-divisor n)
    (define (square x) (* x x))
    (define (divides? a b)
      (= (remainder b a) 0))
    (define (find-divisor n test-divisor)
      (cond
        [(> (square test-divisor) n) n]
        [(divides? test-divisor n) test-divisor]
        [else (find-divisor n (+
                               test-divisor
                               (if (> test-divisor 2) 2 1)))]))
    (find-divisor n 2))
  (= n (smallest-divisor n)))
(define (timed-prime-test n)
  (newline)
  (display n)
  (define (start-prime-test n start-time)
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (if (prime? n)
        (report-prime (- (runtime) start-time))))
  (start-prime-test n (runtime)))