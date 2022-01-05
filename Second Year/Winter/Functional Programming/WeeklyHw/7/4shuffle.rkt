#lang racket
#|
    Седмица 7. Задача 4
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (shuffle xs)
  (define (helper xs1 ys1 new-xs)
    (if (null? xs1)
        new-xs
        (helper (cdr xs1) (cdr ys1) (append new-xs (list (car xs1)) (list (car ys1))))
     )

  )

  (helper (take xs (/ (length xs) 2)) (drop xs (/ (length xs) 2)) '()  )

)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (shuffle '(2 5 1 3 4 7)) '(2 3 5 4 1 7))
(equal? (shuffle '(1 2 3 4 4 3 2 1)) '(1 4 2 3 3 2 4 1))
(equal? (shuffle '(1 1 2 2)) '(1 2 1 2))