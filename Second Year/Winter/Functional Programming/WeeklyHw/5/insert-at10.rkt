#lang racket
#|
    Week 5. Question 10
    -------------------
    Define a procedure (insert-at x position xs) that
    inserts an element at a current index.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (insert-at x position xs)
  (define (helper pos left-xs right-xs )
    (if (zero? pos)
        (remove-duplicates (append left-xs (list x) right-xs))
        (helper (sub1 pos)
                (append left-xs (list (car right-xs)))
                (cdr right-xs)
        )
    )
  )
  (helper position '() xs)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (insert-at 1 0 '()) '(1))
(equal? (insert-at 1 0 '(2)) '(1 2))
(equal? (insert-at 10 1 '(1 2 3)) '(1 10 2 3))