#lang sicp
(define (pascal-triangle level n)
  (if (or (= n 0) (= n level))
      1
      (+
       (pascal-triangle (dec level) (dec n))
       (pascal-triangle (dec level) n))))