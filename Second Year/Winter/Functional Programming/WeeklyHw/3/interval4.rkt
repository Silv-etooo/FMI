#lang racket
#|
    Week 3. Task 4
    Define a recursive procedure (sum-divisible-numbers start
    finish k) that returns the sum of all numbers from the
    interval [start, finish] whose digits sum up to a number
    that is evenly divisible by k.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (evenly-div? num k)
  (define (helper curr-num sum)
    ;base
    (if (zero? curr-num)
        (if (zero? (remainder sum k))
            #t
            #f
        )
        ;recursive call
        (helper (quotient  curr-num 10) (+ sum (remainder curr-num 10)))
    )
  )
  (helper num 0)
)


(define (sum-divisible-numbers start finish k)
  (define(helper current-num)
    (cond
      [(> current-num finish) 0]
      [(evenly-div? current-num k) (+ current-num (helper (add1 current-num)) )  ]
      [else (helper (add1 current-num) )]
    )
  )

  
 (if (> start finish)
      (sum-divisible-numbers finish start k)
      (helper start)
   )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; task cases
(= (sum-divisible-numbers 0 10 5) 5)
(= (sum-divisible-numbers 0 100 5) 990)
(= (sum-divisible-numbers 100 0 5) 990)