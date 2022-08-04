#lang sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (integral f n a b)
  (let ((h (/ (- b a) n)))
    (/
     (* h (sum f))
     3)
    ))