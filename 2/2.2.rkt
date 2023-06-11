#lang sicp
(define (make-segment a b) (cons a b))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))
(define (midpoint-segment segment)
  (let ([a (start-segment segment)]
        [b (end-segment segment)])
    (make-point
     (/ (+ (x-point a) (x-point b)) 2)
     (/ (+ (y-point a) (y-point b)) 2))))
(print-point (midpoint-segment
              (make-segment
               (make-point 1 2)
               (make-point 3 4))))