#lang sicp
(define (repeated f n)
  (define (iter index p)
    (if (= index 0)
        p
        (iter
         (dec index)
         (lambda (x) (f (p x))))))
  (iter n identity))
((repeated (lambda (x) (* x x)) 2) 5)
; 625