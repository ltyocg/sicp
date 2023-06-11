#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (enumerate-interval a b)
  (cond [(> a b) nil]
        [(= a b) (list a)]
        [else (cons a (enumerate-interval (inc a) b))]))
(define (filter proc seq)
  (accumulate
   (lambda (x y) (if (proc x) (append (list x) y) y))
   nil
   seq))
(define (prime? n)
  (define (smallest-divisor n)
    (define (square x) (* x x))
    (define (divides? a b)
      (= (remainder b a) 0))
    (define (find-divisor n test-divisor)
      (cond [(> (square test-divisor) n) n]
            [(divides? test-divisor n) test-divisor]
            [else
             (find-divisor n (+
                              test-divisor
                              (if (> test-divisor 2) 2 1)))]))
    (find-divisor n 2))
  (= n (smallest-divisor n)))
(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list j i)) (enumerate-interval 1 (dec i))))
   (enumerate-interval 1 n)))
(define (make-pair-sum pair)
  (let ([i (car pair)]
        [j (cadr pair)])
    (list i j (+ i j))))
(define (prime-sum-pairs n)
  (filter prime? (unique-pairs n)))