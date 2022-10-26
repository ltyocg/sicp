#lang sicp
(define (fringe x)
  (cond
    ((null? x) nil)
    ((not (pair? x)) (list x))
    (else
     (append (fringe (car x))
             (fringe (cdr x))))))
(fringe (let ((x '((1 2) (3 4)))) (list x x)))