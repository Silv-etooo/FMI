#lang racket
(require racket/trace)
#|
   Week 6. Task 2
   --------------
   Define a procedure that reverses a list using foldr.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (rev-append xs x)
  (append x xs)
)


(define (my-reverse-foldr xs)

  
 (foldr rev-append  '()  (map (λ (x) (list x)) xs) ) ;turn every element into a list

)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (my-reverse-foldr '(1 2 3 4 5)) '(5 4 3 2 1))