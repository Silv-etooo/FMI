#lang racket
#|
   Week 6. Task 4
   --------------
   Define a procedure that returns a list of pairs comprising
   the cartesian product of two sets.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (add-pairs xi ys new-xs)

  (define (helper curr-ys new-new-xs)
    (if (null? curr-ys)
        new-new-xs
        (helper (cdr curr-ys)
                (append new-new-xs (list (cons xi (car curr-ys) ))))
    )
    
  )

  (helper ys new-xs)
)


(define (my-cartesian-product xs ys)
  (define (helper curr-xs new-xs)
    (if (null? curr-xs)
        new-xs
        (helper (cdr curr-xs) (add-pairs (car curr-xs) ys new-xs)))
    )
  
  (helper xs '())
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (my-cartesian-product '(1 2) '(3 4)) '((1 . 3) (1 . 4) (2 . 3) (2 . 4)))
(equal? (my-cartesian-product '(1 2 3 4 5) '(6 7 8)) '((1 . 6) (1 . 7) (1 . 8) (2 . 6) (2 . 7) (2 . 8) (3 . 6) (3 . 7) (3 . 8) (4 . 6) (4 . 7) (4 . 8) (5 . 6) (5 . 7) (5 . 8)))