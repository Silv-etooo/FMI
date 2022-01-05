#lang racket
(require racket/trace)

#|
   Homework 4. Task 3
   Define a procedure that takes a single argument procedure
   and returns it applied n times.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( define (apply-n f n)
   (define (helper x n)
     (if (= n 1)
          (f x)
          (f  (helper x (sub1 n)))
      )
   )

   (λ (x)
     (helper x n)
   )

; a failed attempt that i dont underestand why it doesnt work   
;    (λ (x)
;      (if (= n 1)
;          (f x)
;          (f  (apply-n f (sub1 n))  )
;      )
;    )
   


)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(= ((apply-n (λ (x) (* 2 x)) 5) 2) 64)
(= ((apply-n (λ (x) (quotient x 10)) 2) 100) 1)