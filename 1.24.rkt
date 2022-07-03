#lang sicp
(define (fermat-test n)
  (define (square x) (* x x))
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m)) m))
          (else
           (remainder (* base (expmod base (dec exp) m)) m))))
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (inc (random (dec n)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (dec times)))
        (else false)))
(define (timed-prime-test n)
  (newline)
  (display n)
  (define (start-prime-test n start-time)
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time))
    (if (fast-prime? n 1)
        (report-prime (- (runtime) start-time))))
  (start-prime-test n (runtime)))