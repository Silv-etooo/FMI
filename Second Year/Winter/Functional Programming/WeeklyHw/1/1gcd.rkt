#lang racket


(define (my-gcd x y)
  (if (= 0 x)
      y
      
      (if (= 0 y)
          x
          (my-gcd y (remainder x y))
          )  )

  
)

(= (my-gcd 5 13) 1)
(= (my-gcd 13 1235) 13)