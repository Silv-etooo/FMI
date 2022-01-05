#lang racket
#|
   Homework 4. Task 1
   Define a procedure that accepts an unary procedure f and a
   number y and returns an unary procedure that for every x
   returns:
          y, if it is greater than or equal to the result of
          applying f to x;
          the result of applying f to x, otherwise.

|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (upper-bound f y)
  (λ (x)(if(> y (f x))
           y
           (f x)
  ))
                       
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(= ((upper-bound (lambda (x) (* x 2)) 100) 50) 100)
;If g is upper-bound (λ (x) (* 2 x)) 100.236
   ;then g 500.002 -> 1000.004
;If g is upper-bound identity 1.001
    ;then g 1.001 -> 1.001