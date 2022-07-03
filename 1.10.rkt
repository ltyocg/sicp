#lang sicp
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
; 1024
(A 1 10)
; 65536
(A 2 4)
; 65536
(A 3 3)
; (define (f n) (* 2 n))
(define (f n) (A 0 n))
; (define (g n)
;   (cond ((= n 0) 0)
;         ((= n 1) 2)
;         (else (* 2 (g (dec n))))))
(define (g n) (A 1 n))
; (define (h n)
;   (cond ((= n 0) 0)
;         ((= n 1) 2)
;         (else (g (h (dec n))))))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))