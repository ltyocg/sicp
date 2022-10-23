#lang sicp
(define (make-center-percent c percent)
  (let ((w (* c percent)))
    (cons (- c w) (+ c w))))
(define (center i)
  (/ (+ (car i) (cdr i)) 2))
(define (percent i)
  (/
   (/ (- (cdr i) (car i)) 2)
   (center i)))