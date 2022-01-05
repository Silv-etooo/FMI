#lang racket
#|
  Week 2. Task 7.
  Define a procedure that returns the number of occurrences
  of a digit in a positive number.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (count-occurences num digit)
  (define (helper curr-num digit num-of-occurrences)
    ;base
    (if (<= curr-num 0)
        num-of-occurrences
        
        ;recursive call
        (if (= digit (remainder curr-num 10))
               (helper (quotient curr-num 10) digit (+ num-of-occurrences 1))
               (helper (quotient curr-num 10) digit num-of-occurrences)

        )
    )
  )

  ;eroor check and helper call
  (if( < num 0)
      (error "Negative number!")
      (helper num digit 0)
   )
  
)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (count-occurences 121 1) 2)
(count-occurences -121 1) ; error "Negative number!"