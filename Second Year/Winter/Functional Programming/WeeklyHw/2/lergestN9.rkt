#lang racket
#|
  Week 2. Task 9.
  Given a divisor d and a bound b, find the largest integer N,
  such that:

     N is divisible by d
     and N is less than or equal to b
     and N is greater than 0.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( define (max-multiple d b)
   (define (helper d curr-b )
     ;base
     (if (< curr-b 0)
         1

         ;recursive call
         (if (= 0 (remainder curr-b d))
            curr-b
            (helper d (- curr-b 1))

         )
     )
   )
   (helper d b)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (max-multiple 2 7) 6)
(= (max-multiple 3 10) 9)
(= (max-multiple 7 17) 14)
(= (max-multiple 10 50) 50)
(= (max-multiple 37 200) 185)
(= (max-multiple 7 100) 98)