#lang racket



( define (helper newX x )

   (if (= x 0)
       newX
       (helper  (+   (* newX 10) (remainder x 10))  (quotient x 10) )


               
    )
   


 )




( define (rev x)

   (helper 0 x )



 )



(= (rev 1) 1)
(= (rev 123) 321)
(= (rev 987654321) 123456789)