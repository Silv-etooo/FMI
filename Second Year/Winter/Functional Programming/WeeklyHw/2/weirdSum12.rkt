#lang racket
(require racket/trace)
#|
   Week 2. Task 12. 
   Write a procedure that accepts three whole numbers - a, b and
   n and returns the sum of the last three numbers from the
   following sequence.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (squares n)
  (define (helper curr-n curr-sum)
    ;base
    (if (= curr-n 0)
        curr-sum
        ;recuersive call
        (helper (- curr-n 1) (* curr-sum 2))
    )
  )
  (helper n 1)
)

(define (sum a b n)
  (define (helper a b curr-n curr-sum)
    ;base
    (if (= curr-n 0)
        (+ curr-sum a)
        ;recursive call
        (helper a b (- curr-n 1) (+ curr-sum (* b (squares (- curr-n 1)) )))
    )
  )
  (helper a b n 0)
)

( define (find-sum a b n)
   (+ (sum a b (- n 2)) (sum a b (- n 1)) (sum a b n))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(= (find-sum 0 2 10) 3578) ; 510 + 1022 + 2046
(= (find-sum 5 3 5) 174) ; 26 + 50 + 98