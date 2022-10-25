#lang sicp
(define (fringe x)
  (cond
    ((null? x) nil)
    ((not (pair? x)) x)
    (else
     (append (list (fringe (car x)))
             (fringe (cdr x))))))
(fringe (let ((x '((1 2) (3 4)))) (list x x)))