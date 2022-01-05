#lang racket
#|
  Week 2. Task 2.
  Define an iterative procedure for calculating the sum of the
  digits of a non-negative number.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sum-digits-iter x)
  (define (helper curr-x curr-sum)
    ;base
    (if (< curr-x 10)
        (+ curr-sum (remainder curr-x 10))
        ;recursive call
        (helper (quotient curr-x 10) (+ curr-sum (remainder curr-x 10) ))
    )
  )


  
  ;error check and helper call
  (if (< x 0)
      (error "x is negative")
      (helper x 0)
      
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (sum-digits-iter 12345) 15)
(= (sum-digits-iter 123) 6)
; (sum-digits-iter -13) ; error "n was negative"
