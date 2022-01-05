#lang racket
#|     Week 5. Task 3
       -----------------
       Define a procedure set-union xs ys that takes two
       sets of numbers and returns their union. It (the union)
       must be sorted in ascending order!
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (set-union xs ys)
  (remove-duplicates(sort (flatten (cons xs ys)) <))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (set-union '(1 3 5 7) '(5 7 13)) '(1 3 5 7 13))
(equal? (set-union '(5 7 13) '(1 3 5 7)) '(1 3 5 7 13))