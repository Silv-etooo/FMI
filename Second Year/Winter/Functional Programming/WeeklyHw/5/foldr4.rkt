#lang racket
#|     Week 5. Task 4
       -----------------
       Define a procedure that accepts a list of digits and
       returns the number that is build by traversing the
       list from right to left.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (rev-fold xs)
   (foldr (λ (x acc) (+ (* acc 10) x)) 0 xs)
)

(define (rev-lin-rec xs)

   (cond
     ;base
     [(null? xs) 0 ]
     ;recursive tail
     [else (+ (car xs)
              (* 10 (rev-lin-rec (cdr xs)) )
              )]
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
; using folding
(= (rev-fold '(1 2 3)) 321)
(= (rev-fold '(1 2 3 4 5 6 7 8 9)) 987654321)

; using a linearly recursive procedure
(= (rev-lin-rec '(1 2 3)) 321)
(= (rev-lin-rec '(1 2 3 4 5 6 7 8 9)) 987654321)