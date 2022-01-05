#lang racket
(require math/number-theory)
(require racket/trace)
#|
   Week 2. Task 11. 
   A cubic prime number is a prime number that is the difference
   between two subsequent natural numbers. For example, 61 is
   such a number because 61 = 5^3 - 4^3.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cubic x)
  (- (* (+ x 1) (+ x 1) (+ x 1)) (* x x x))
)


(define (nth-cubic n)
  (define (helper curr-n curr-x )
    ;base
    (if (= curr-n 0)
       (cubic (- curr-x 1) )
     
       (if (prime? (cubic curr-x))
         (helper (- curr-n 1) (+ curr-x 1) )
         (helper curr-n (+ curr-x 1))
       )
    )
  )
  ;error check and function call
  (if (<= n 0)
      (error "non positive number")
      (helper n 1)
  )
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (nth-cubic 1) 7)
(= (nth-cubic 4) 61)
(= (nth-cubic 50) 55897)
(= (nth-cubic 100) 283669)
(= (nth-cubic 200) 1570357)
; (nth-cubic 0) ; should return an error