#lang racket
#|
    Week 3. Task 1
    Define a procedure that removes the first occurrence of a
    digit in a number by going from right to left.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;idea
; find the occurrence
; in doing so split the number the one to the right and to left of the digit
; concatenate the two parts

( define (concatenate left-num right-num right-num-digits)
   (+ (* left-num (expt 10 right-num-digits )) right-num)
)


( define (remove-first-occurrence num d)
   ( define (helper left-num right-num right-num-digits d)
      ;base
      ( if (= (remainder left-num 10) d)
           (concatenate (quotient left-num 10) right-num right-num-digits)
           ;recursive call
           (helper
                (quotient left-num 10)
                (concatenate (remainder left-num 10) right-num  right-num-digits)
                (add1 right-num-digits)
                d
           )
      )
   )
   (helper num 0 0 d)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; task cases
(= (remove-first-occurrence 15365 5) 1536)
(= (remove-first-occurrence 15360 0) 1536)
(= (remove-first-occurrence 15300 0) 1530)
(= (remove-first-occurrence 15365 1) 5365)
(= (remove-first-occurrence 35365 3) 3565)
(= (remove-first-occurrence 1212 1) 122)
(= (remove-first-occurrence 1212 2) 121)
(= (remove-first-occurrence (remove-first-occurrence 1212 1) 1) 22)