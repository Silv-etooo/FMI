#lang racket
#|
   Week 6. Task 3
   --------------
   Define a procedure that takes a list of numbers and returns a
   list of pairs in the form (xi . ni) where xi spans the elements
   of xs and ni is the number of elements in xs that are greater
   than xi.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (num-greater xs xi)
  (length  (filter (λ (x) (> x xi)) xs))
)


(define (num-bigger-elements xs)

  
  (define (helper curr-xs new-xs)
    (if (null? curr-xs)
      ;base
      new-xs
      ;recursive call
      (helper (cdr curr-xs)
              (append new-xs (list (cons (car curr-xs)  (num-greater xs (car curr-xs))  ))) )
     )
  )
  (helper xs '())
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (num-bigger-elements '(5 6 3 4)) '((5 . 1) (6 . 0) (3 . 3) (4 . 2)))
(equal? (num-bigger-elements '(1 1 1)) '((1 . 0) (1 . 0) (1 . 0)))