#lang sicp
(define (same-parity n . l)
  (define (iter l result)
    (if (null? l)
        result
        (let ((first (car l)))
          (iter
           (cdr l)
           (if (even? (+ n first))
               (append result (list first))
               result)))))
  (iter l (list n)))