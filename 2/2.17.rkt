#lang sicp
(define (last-pair list)
  (let ([rest (cdr list)])
    (if (null? rest)
        (car list)
        (last-pair rest))))