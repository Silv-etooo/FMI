#lang racket




( define (helper upSpeed downSpeed desiredHeight cuurHeight day)
   (if (>= cuurHeight desiredHeight)
       day
       (helper upSpeed downSpeed desiredHeight (+ cuurHeight (- upSpeed downSpeed)) (+ day 1))
    )



 )


( define (snail desiredHeight up down)

   (helper up down desiredHeight up 1)



 )



(= (snail 3 2 1) 2)
(= (snail 10 3 1) 5)
(= (snail 10 3 2) 8)
(= (snail 100 20 5) 7)
(= (snail 5 10 3) 1)