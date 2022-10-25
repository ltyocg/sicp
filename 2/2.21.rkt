#lang sicp
; (define (square-list items)
;   (if (null? items)
;       nil
;       (cons
;        (let ((i (car items))) (* i i))
;        (square-list (cdr items)))))
(define (square-list items)
  (map (lambda (x) (* x x)) items))