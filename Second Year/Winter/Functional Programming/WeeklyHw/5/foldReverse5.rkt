#lang racket
#|
    Week 5. Question 5
    -------------------
    Define a procedure that reverses a list using foldl.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;признавам си докато гледах документацията видях решението в примерите

(define (my-reverse-foldl xs)
    (foldl cons '() xs)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (my-reverse-foldl '(1 2 3 4 5)) '(5 4 3 2 1))