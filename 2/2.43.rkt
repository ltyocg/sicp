#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (filter proc seq)
  (accumulate
   (lambda (x y) (if (proc x) (append (list x) y) y))
   nil
   seq))
(define (enumerate-interval a b)
  (cond [(> a b) nil]
        [(= a b) (list a)]
        [else (cons a (enumerate-interval (inc a) b))]))
(define (queen board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (new-row)
            (map
             (lambda (rest-of-queens) (adjoin-position new-row k rest-of-queens))
             (queen-cols (dec k))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))
(define empty-board '())
(define (safe? k positions)
  (let ([rev-positions (reverse positions)])
    (define (ok? v pos offset)
      (cond [(null? pos) #t]
            [(let ([first (car pos)])
               (or (= v first)
                   (= v (- first offset))
                   (= v (+ first offset))))
             #f]
            [else (ok? v (cdr pos) (inc offset))]))
    (ok? (car rev-positions) (cdr rev-positions) 1)))
(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))
(queen 8)