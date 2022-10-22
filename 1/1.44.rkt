#lang sicp
(define (smooth f)
  (let ((dx 1e-5))
    (lambda (x)
      (/
       (+ (f (- x dx)) (f x) (f (+ x dx)))
       3))))
(define (n-smooth f n)
  (define (repeated f n)
    (define (iter index p)
      (if (= index 0)
          p
          (iter
           (dec index)
           (lambda (x) (f (p x))))))
    (iter n identity))
  ((repeated smooth n) f))