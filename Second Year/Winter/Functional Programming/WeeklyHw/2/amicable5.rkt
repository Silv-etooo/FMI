#lang racket
(require math/number-theory)
#|
  Week 2. Task 5.
  Define a predicate that checks whether two numbers are amicable.
  Note: Two numbers are amicable if the sum of the divisors of
        one of them is equal to the other.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;from in class excersises
(define (sum-divs x)
  (define (helper curr-sum curr-x)
    (cond
      [(= curr-x 1) (+ curr-sum 1)  ]
      [(divides? curr-x x) (helper (+ curr-sum curr-x)(sub1 curr-x))]
      [else (helper curr-sum (sub1 curr-x))]
      )

    )
  (if (< x 1)
      0
      (helper 0 x)
   )
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (amicable? x y)
  (if (= (sum-divs x) (sum-divs y))
   #t
   #f
  )

)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; test cases
(equal? (amicable? 200 300) #f)
(equal? (amicable? 220 284) #t)
(equal? (amicable? 284 220) #t)
(equal? (amicable? 1184 1210) #t)
(equal? (amicable? 2620 2924) #t)
(equal? (amicable? 6232 6368) #t)