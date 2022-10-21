#lang sicp
(define (cont-frac n d k)
  (define (iter index)
    (if (> index k)
        0
        (/ (n index) (+ (d index) (iter (inc index))))))
  (iter 1))
(+ 2 (cont-frac
      (lambda (i) 1)
      (lambda (i) (if (= 2 (remainder i 3))
                      (* 2 (inc (quotient i 3)))
                      1))
      100))