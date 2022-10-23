#lang sicp
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
(define (mul-interval x y)
  (let ((x0 (lower-bound x))
        (x1 (upper-bound x))
        (y0 (lower-bound y))
        (y1 (upper-bound y)))
    (cond
      ((< 0 x0)
       (cond ((< 0 y0) (make-interval (* x0 y0) (* x1 y1)))
             ((> 0 y1) (make-interval (* x1 y0) (* x0 y1)))
             (else (make-interval (* x1 y0) (* x1 y1)))))
      ((> 0 x1)
       (cond ((< 0 y0) (make-interval (* x0 y1) (* x1 y0)))
             ((> 0 y1) (make-interval (* x1 y1) (* x0 y0)))
             (else (make-interval (* x0 y1) (* x0 y0)))))
      (else
       (cond ((< 0 y0) (make-interval (* x0 y1) (* x1 y1)))
             ((> 0 y1) (make-interval (* x1 y0) (* x0 y0)))
             (else (make-interval
                    (min (* x0 y1) (* x1 y0))
                    (max (* x0 y0) (* x1 y1)))))))))