#lang racket


(define (leap-year-one-line? x)
  (or     (= 0 (remainder x 400))           (and   (= 0 (remainder x 4))     (not(= 0 (remainder x 100)) ) )        )

  
)


(define (is-leap-year-guards? x)
  (if   (= 0 (remainder x 400))
     #t
     (if   (= 0 (remainder x 100))
           #f
           (if   (= 0 (remainder x 4))
                 #t
                 #f

           )

     )
  )

)



(equal? (leap-year-one-line? 2020) #t)
(equal? (leap-year-one-line? 1988) #t)
(equal? (leap-year-one-line? 1600) #t)
(equal? (leap-year-one-line? 2400) #t)
(equal? (leap-year-one-line? 2023) #f)
(equal? (leap-year-one-line? 1700) #f)
(equal? (leap-year-one-line? 1800) #f)
(equal? (leap-year-one-line? 2100) #f)

(equal? (is-leap-year-guards? 2020) #t)
(equal? (is-leap-year-guards? 1988) #t)
(equal? (is-leap-year-guards? 1600) #t)
(equal? (is-leap-year-guards? 2400) #t)
(equal? (is-leap-year-guards? 2023) #f)
(equal? (is-leap-year-guards? 1700) #f)
(equal? (is-leap-year-guards? 1800) #f)
(equal? (is-leap-year-guards? 2100) #f)