#lang sicp
(define (root x n)
  (define (fixed-point f first-guess)
    (let ((tolerance 1e-5))
      (define (try guess)
        (let ((next (f guess)))
          (if (< (abs (- guess next)) tolerance)
              next
              (try next))))
      (try first-guess)))
  (define (average-damp f)
    (lambda (x) (/ (+ x (f x)) 2)))
  (define (repeated f n)
    (define (iter index p)
      (if (= index 0)
          p
          (iter
           (dec index)
           (lambda (x) (f (p x))))))
    (iter n identity))
  (if (= n 1)
      x
      (fixed-point
       (average-damp (lambda (y)
                       (/ x ((repeated * (dec n)) y))))
       1)))