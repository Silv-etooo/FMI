#lang racket

#|
  Week 2. Task 1.
  Define a recursive and an iterative procedure for calculating
  the number of digits of a non-negative number.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 1. iterative procedure
(define (count-digits-iter x)
  (define (helper curr-x num-of-x)
    ; base
    (if (< curr-x 10)
        (+ num-of-x 1)
        ; reqursive call
        (helper (/ curr-x 10) (+ num-of-x 1))
    )
  )

  ;error check and helper call
  (if(< x 0)
     (error "x is negative")
     (helper x 0)
  )
)


; 2. recursive procedure
(define (count-digits-rec x)
   (cond
    [(not (positive? x)) (error "n was negative")]
    [(< x 10) 1]
    [else (+ 1 (count-digits-rec (/ x 10)))]
  )

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (count-digits-iter 12345) 5)
(= (count-digits-iter 123) 3)

(= (count-digits-rec 12345) 5)
(= (count-digits-rec 123) 3)
;(count-digits-iter -13) ; error "n was negative"
