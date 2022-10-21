#lang sicp
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (combiner
       (let ((num (term a)))
         (if (filter num) num null-value))
       (filtered-accumulate combiner null-value term (next a) next b filter))))
(filtered-accumulate
 +
 0
 identity
 2
 inc
 100
 (lambda (n)
   (define (smallest-divisor n)
     (define (square x) (* x x))
     (define (divides? a b)
       (= (remainder b a) 0))
     (define (find-divisor n test-divisor)
       (cond
         ((> (square test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor n (+
                                test-divisor
                                (if (> test-divisor 2) 2 1))))))
     (find-divisor n 2))
   (= n (smallest-divisor n))))
(let ((n 8))
  (filtered-accumulate
   *
   1
   identity
   2
   inc
   100
   (lambda (num)
     (and
      (< num n)
      (= 1 (gcd num n))))))