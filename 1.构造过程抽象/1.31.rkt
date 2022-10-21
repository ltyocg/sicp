#lang sicp
(define (product term a next b)
  (if (> a b)
      1
      (*
       (term a)
       (product term (next a) next b))))
(define (factorial n)
  (product identity 1 inc n))
(define (pi scale)
  (* 4 (product
        (lambda (x)
          (let ((n (inc (* 2 x))))
            (/ (* (dec n) (inc n)) (* n n))))
        1
        inc
        scale)))