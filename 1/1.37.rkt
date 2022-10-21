#lang sicp
(define (cont-frac n d k)
  (define (iter index)
    (if (> index k)
        0
        (/ (n index) (+ (d index) (iter (inc index))))))
  (iter 1))
(cont-frac (lambda (i) 1) (lambda (i) 1) 12)
(define (cont-frac2 n d k)
  (define (iter index result)
    (if (> 1 index)
        result
        (iter (dec index) (/
                           (n index)
                           (+ (d index) result)))))
  (iter k 0))
(cont-frac2 (lambda (i) 1) (lambda (i) 1) 12)