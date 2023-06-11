#lang sicp
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
(define (mul-interval x y)
  (let ([x0 (lower-bound x)]
        [x1 (upper-bound x)]
        [y0 (lower-bound y)]
        [y1 (upper-bound y)])
    (let ([p1 (* x0 y0)]
          [p2 (* x0 y1)]
          [p3 (* x1 y0)]
          [p4 (* x1 y1)])
      (make-interval
       (min p1 p2 p3 p4)
       (max p1 p2 p3 p4)))))
(define (div-interval x y)
  (if (< 0 (/ (upper-bound y) (lower-bound y)))
      0
      (mul-interval
       x
       (make-interval
        (/ 1.0 (upper-bound y))
        (/ 1.0 (lower-bound y))))))