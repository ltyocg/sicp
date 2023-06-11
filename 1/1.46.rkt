#lang sicp
(define (sqrt n)
  (define (iterative-improve good-enough? improve)
    (lambda (x)
      (let ([new (improve x)])
        (if (good-enough? x new)
            x
            ((iterative-improve good-enough? improve) new)))))
  ((iterative-improve
    (lambda (v1 v2)
      (let ([tolerance 1e-5])
        (< (/ (abs (- v1 v2)) v2) tolerance)))
    (lambda (x) (/ (+ x (/ n x)) 2)))
   1.0))