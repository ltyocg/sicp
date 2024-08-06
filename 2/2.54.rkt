#lang sicp
(define (equal? a b)
  (cond [(eq? a b) #t]
        [(not (and (pair? a) (pair? b))) #f]
        [else (and (equal? (car a) (car b))
                   (equal? (cdr a) (cdr b)))]))
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))