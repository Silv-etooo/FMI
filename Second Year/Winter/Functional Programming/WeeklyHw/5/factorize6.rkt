#lang racket
#|
    Week 5. Question 6
    -------------------
    According to the fundamental theorem of arithmentics
    every natural number greater than 2 can be expressed
    as a product of prime numbers. Define a procedure that
    returns the sorted list of prime factors of a natural
    number.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (prime-fac curr-num)
  (define (helper i)
    ;base 
    (if (zero? (remainder curr-num i))
               i
               (helper (add1 i))
     )          
  )
  (helper 2)
)


(define (factorize num)
  (define (helper curr-num xs)
    ;base
    (if (= 1 curr-num)
        xs
        ;recursive call
        (helper
             (/ curr-num (prime-fac curr-num)) ;има ли начин как това да се направи без да викам prime-fac 2 пъти за едно и също нещо
             (cons (prime-fac curr-num) xs))
    )
  )
  (sort (helper num '()) <)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (factorize 2) '(2))
(equal? (factorize 6) '(2 3))
(equal? (factorize 13) '(13))
(equal? (factorize 123) '(3 41))
(equal? (factorize 152) '(2 2 2 19))
(equal? (factorize 12356498) '(2 7 11 19 41 103))