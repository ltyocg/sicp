#lang sicp
(define (fermat-test n)
  (define (square x) (* x x))
  (define (expmod base exp m)
    (cond
      ((= exp 0) 1)
      ((even? exp)
       (remainder (square (expmod base (/ exp 2) m)) m))
      (else
       (remainder (* base (expmod base (dec exp) m)) m))))
  (define (try-it a)
    (define (miller-rabin-check base p)
      (define (iter n)
        (define (ring-equals r) (or (= 1 r) (= (dec p) r)))
        (or
         (<= n base)
         (and
          (ring-equals (expmod base n p))
          (iter (/ (if (even? n) n (dec n)) 2)))))
      (iter (dec p)))
    (and (miller-rabin-check 2 n) (= (expmod a n n) a)))
  (try-it (inc (random (dec n)))))
(define (fast-prime? n times)
  (cond
    ((= times 0) #t)
    ((fermat-test n) (fast-prime? n (dec times)))
    (else #f)))
(fast-prime? 561 1)
(fast-prime? 1105 1)
(fast-prime? 1729 1)
(fast-prime? 2465 1)
(fast-prime? 2821 1)
(fast-prime? 6601 1)