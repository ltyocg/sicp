#lang sicp
(car (cdaddr '(1 3 (5 7) 9)))
(car (cdr (car (cdr (cdr '(1 3 (5 7) 9))))))
(caar '((7)))
(cadadr (cadadr (cadadr '(1 (2 (3 (4 (5 (6 7)))))))))