#lang sicp
(define (tan-cf x k)
  (define (cont-frac n d k)
    (define (iter index result)
      (if (> 1 index)
          result
          (iter (dec index) (/
                             (n index)
                             (+ (d index) result)))))
    (iter k 0))
  (cont-frac
   (lambda (i)
     (if (= 1 i)
         x
         (- (* x x))))
   (lambda (i) (dec (* 2 i)))
   k))
(tan-cf 4 16)
(tan 4)