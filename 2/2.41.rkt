#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (filter proc seq)
  (accumulate
   (lambda (x y) (if (proc x) (append (list x) y) y))
   nil
   seq))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (unique-pairs n)
  (define (enumerate-interval a b)
    (cond [(> a b) nil]
          [(= a b) (list a)]
          [else (cons a (enumerate-interval (inc a) b))]))
  (flatmap
   (lambda (i)
     (map
      (lambda (j) (list j i))
      (enumerate-interval 1 (dec i))))
   (enumerate-interval 1 n)))
(define (f n)
  (filter
   (lambda (triple)
     (let ([a1 (car triple)]
           [a2 (cadr triple)]
           [a3 (caddr triple)])
       (and (< a3 n)
            (< a2 a3))))
   (map
    (lambda (p)
      (append p (list (- n (car p) (cadr p)))))
    (unique-pairs n))))