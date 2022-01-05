#lang racket

(require math/number-theory)
#|
  Week 2. Task 6.
  Define a procedure sum-special-primes n d that returns the
  sum of the first n prime numbers that contain a digit d.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; returns wheter a number contains a specific digit
(define (contain-digit? num d)
  (define (helper curr-num d)
    ;base
    (if (<= curr-num 0)
        #f
        ;recursive call
        (if (= (remainder curr-num 10) d)
            #t
            (helper (quotient curr-num 10) d)
        )
    )
  )

  (helper num d)
)



; returns wheter a number is special-prime
(define (special-prime? num d)
  (if(prime? num)
     ;contain a digit d?
     (if(contain-digit? num d)
        #t
        #f
     )
     #f
  )
  
)



; returns the sum of the first n special-prime numbers
(define (sum-special-primes n d)
 (define (helper curr-n d curr-num sum)
   ;base
   ;if the program find n numbers, return sum
   (if(= curr-n 0)
      sum
      ;recursive call
      ;is the curr-number a special prime
      (if (special-prime? curr-num d)
          (helper (- curr-n 1) d (+ curr-num 1) (+ sum curr-num))
          (helper curr-n d (+ curr-num 1) sum) 
      )

   )
 )
 (helper n d 1 0)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (sum-special-primes 5 2) 392) ;2 + 23 + 29 +127 + 211
(= (sum-special-primes 5 3) 107)
(= (sum-special-primes 10 3) 462)