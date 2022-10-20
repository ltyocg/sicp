#lang sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (integral f n a b)
  (define h (/ (- b a) n))
  (define (double num) (* 2 num))
  (define (next num) (+ num (double h)))
  (*
   (/ h 3)
   (+
    (f a)
    (f b)
    (* 4 (sum f (+ a h) next (- b h)))
    (double (sum f (+ a (double h)) next (- b (double h)))))))
(integral (lambda (x) (* x x)) 100 0 3)
(integral (lambda (x) (* x x)) 1000 0 3)