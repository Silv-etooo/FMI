#lang racket
#|
  Week 2. Task 8.
  A number is interesting if and only if it is evenly divided
  by the sum of its digits. Define a predicate that checks
  whether a number is interesting.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; from in-class excersies
(define (sum-digits-rec n)
  (cond
    [(not (positive? n)) (error "n was not positive")]
    [(< n 10) n]
    [else (+ (remainder n 10) (sum-digits-rec (quotient n 10)))]
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( define (interesting? num)
   (if (= 0 (remainder num (sum-digits-rec num)))
       #t
       #f
   )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(equal? (interesting? 410) #t)