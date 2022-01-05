#lang racket





( define (helper upSpeed downSpeed desiredHeight cuurHeight day)
   (if (>= cuurHeight desiredHeight)
       day
       (helper upSpeed downSpeed desiredHeight (+ cuurHeight (- upSpeed downSpeed)) (+ day 1))
    )



 )




( define (growing-plant upSpeed downSpeed desiredHeight)
   (helper upSpeed downSpeed desiredHeight upSpeed 1)



 )



(= (growing-plant 5 2 5) 1)
(= (growing-plant 5 2 6) 2)
(= (growing-plant 10 9 4) 1)
(= (growing-plant 100 10 910) 10) ; upSpeed=100, downSpeed=10, desiredHeight=910