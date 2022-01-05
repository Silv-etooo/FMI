#lang racket
#|
   Week 2. Task 10. 
   Define a predicate that accepts a natural number n and returns
   whether n2 ends in the digits of n.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define(automorphic? n)
  (define (helper n-curr n-sqrt-curr)
    ;base
    (if (= 0 n-curr)
        #t
        (if (not(= (remainder n-curr 10) (remainder n-sqrt-curr 10)))
            #f
            ;recursive call
            (helper (quotient n-curr 10) (quotient n-sqrt-curr 10))         
        )     
    )
  )
  ;error check and helper call
  (if(<= n 0)
     (error "n was not natural")
     (helper n (* n n))
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(equal? (automorphic? 3)#f)
(equal? (automorphic? 10)#f)
(equal? (automorphic? 5)#t)
(equal? (automorphic? 25)#t)
(equal? (automorphic? 76)#t) 
(equal? (automorphic? 890625)#t) 
(equal? (automorphic? 625)#t) 
(equal? (automorphic? 36) #f)
(equal? (automorphic? 11) #f)
; (automorphic? -1) ; error: n was not natural
; (automorphic? 0) ; error: n was not natural