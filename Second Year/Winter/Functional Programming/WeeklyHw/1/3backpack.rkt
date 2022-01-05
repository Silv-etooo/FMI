#lang racket


(define (can-carry? c k w)
  (cond
    [(> 0 c) (error "The number of products was negative")]
    [(> 0 k) (error "John's hosting capacity was negative")]
    [(> 0 w) (error "The weight of a product was negative")]       
    )
  
  (if (>= k (* c w))
      #t
      #f

   )

  

)



(equal? (can-carry? 5 15 3) #t)
(equal? (can-carry? 1 5 4) #t)
(equal? (can-carry? 13 25 2) #f)
(equal? (can-carry? 24 104.44 21.12) #f)
(equal? (can-carry? 51 34.75 19.852) #f)
(equal? (can-carry? 42 95.11 0.51) #t)

; (can-carry? -13 25 2) ; error: The number of products was negative
; (can-carry? 13 -25 2) ; error: John's hosting capacity was negative
; (can-carry? 13 25 -2) ; error: The weight of a product was negative