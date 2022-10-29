#lang sicp
(define (square x) (* x x))
(define (tree-map f tree)
  (map
   (lambda (x)
     (if (not (pair? x))
         (f x)
         (tree-map f x)))
   tree))
(define (square-tree tree) (tree-map square tree))