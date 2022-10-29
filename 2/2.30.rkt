#lang sicp
(define (square-tree tree)
  (map
   (lambda (x)
     (if (not (pair? x))
         (* x x)
         (square-tree x)))
   tree))
(square-tree
 (list
  1
  (list 2 (list 3 4) 5)
  (list 6 7)))