#lang racket
#|
    Week 3. Task 5
    A number - x, is a pentagonal number if we can plot x
    poits in the form of a pentagon on a plain.
    Define an iterative procedure that accepts a natural
    number - n, and returns the n-th pentagonal number.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ignorirame fakta 4e ima formula?
( define (p n)
   ( define (helper curr-n add-factor sum)
      (if (= curr-n n)
          sum
          (helper (add1 curr-n) (+ 3 add-factor) (+ add-factor sum))     
      )    
   )
   (helper 1 4 1)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; task cases
(= (p 1) 1)
(= (p 2) 5)
(= (p 3) 12)
(= (p 4) 22)
(= (p 5) 35)
(= (p 6) 51)