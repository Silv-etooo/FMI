#lang racket
(require math/number-theory)
(require racket/trace)
#|
  Week 2. Task 4.
  Define a recursive and an iterative procedure that returns
  the number of palindromes in the interval [a, b].
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;from in class excersises
(define (rev n)
  (define (helper result left-over)
    (if (zero? left-over)
        result
        (helper (+ (* result 10) (remainder left-over 10)) (quotient left-over 10))
        )
    )
  (helper 0 n)
)

(define (palindrome? n)
  (= n (rev n))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1. iterative procedure
( define (num-palindromes-iter a b)
   (define (helper curr-a curr-b num-of-palindromes )
     ;base
     (if (> curr-a curr-b)
       num-of-palindromes
       
       ;recursive call
       (if (palindrome? curr-a)
           (helper (+ curr-a 1) curr-b (+ num-of-palindromes 1))
           (helper (+ curr-a 1) curr-b num-of-palindromes)
       )
     )
   )

   (if (< a b)
       (helper a b 0)
       (helper b a 0)
   )
)


; 2. recursive procedure
(define (num-palindromes-rec a b)
   ;base
   (if(= a b)
      (if (palindrome? a)
          1
          0
      )

      ;recursive call
      (if( < a b)
         (if (palindrome? a)
           (+ (num-palindromes-rec (+ a 1) b) 1)
           (num-palindromes-rec (+ a 1) b)
           
         )
         (if (palindrome? a)
           (+ (num-palindromes-rec (- a 1) b) 1)
           (num-palindromes-rec (- a 1) b)
         ) 
      )
   )  
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (num-palindromes-rec 1 101) 19)
(= (num-palindromes-rec 1 100) 18)
(= (num-palindromes-rec 100 1) 18)

(= (num-palindromes-iter 1 101) 19)
(= (num-palindromes-iter 1 100) 18)
(= (num-palindromes-iter 100 1) 18)