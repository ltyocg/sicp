#lang sicp
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (divisor-num n d)
  (define (iter n index)
    (if (not (zero? (remainder n d)))
        index
        (iter (/ n d) (inc index))))
  (iter n 0))
(define (car n)
  (divisor-num n 2))
(define (cdr n)
  (divisor-num n 3))