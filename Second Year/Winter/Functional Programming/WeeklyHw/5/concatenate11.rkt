#lang racket
#|
    Week 5. Question 11
    -------------------
    Define a procedure that concatenates two lists.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (concat-proc xs ys)
  (append xs ys)
)

(define (concat-rec xs ys)
  (cond
    ;base
    [(null? ys)   '()] 
    ;recursive
    [else   (flatten(cons xs (cons (car ys) (concat-rec '() (cdr ys)) )) ) ]
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
; using a predefined procedure
(equal? (concat-proc '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))

; using a linearly recursive process
(equal? (concat-rec '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))