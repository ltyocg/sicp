#lang sicp
(define (** b e)
  (if (= e 0)
      1
      (* b (** b (dec e)))))
(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define variable? symbol?)
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define addend cadr)
(define augend caddr)
(define (make-sum a1 a2)
  (cond [(=number? a1 0) a2]
        [(=number? a2 0) a1]
        [(and (number? a1) (number? a2)) (+ a1 a2)]
        [else (list '+ a1 a2)]))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (make-product m1 m2)
  (cond [(=number? m1 1) m2]
        [(=number? m2 1) m1]
        [(and (number? m1) (number? m2)) (* m1 m2)]
        [else (list '* m1 m2)]))
(define multiplier cadr)
(define multiplicand caddr)
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define base cadr)
(define exponent caddr)
(define (make-exponentiation b e)
  (cond [(=number? e 0) 1]
        [(=number? e 1) b]
        [(and (number? b) (number? e)) (** b e)]
        [else (list '** b e)]))
(define (deriv exp var)
  (cond [(number? exp) 0]
        [(variable? exp)
         (if (same-variable? exp var) 1 0)]
        [(sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var))]
        [(product? exp)
         (let ([m1 (multiplier exp)]
               [m2 (multiplicand exp)])
           (make-sum (make-product m1 (deriv m2 var))
                     (make-product (deriv m1 var) m2)))]
        [(exponentiation? exp)
         (let ([e (exponent exp)]
               [b (base exp)])
           (make-product e
                         (make-product (make-exponentiation b (make-sum e -1))
                                       (deriv b var))))]
        [else (error "unknown expression type -- DERIV" exp)]))