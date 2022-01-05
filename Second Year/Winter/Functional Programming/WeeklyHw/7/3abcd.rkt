#lang racket
(require racket/trace)
#|
    Седмица 7. Задача 3
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;calculate the number of digis
(define (num-digits n)
  (define (helper curr-n digits)
    ;base
     (if (= 0 curr-n)
         digits
         ;recursive call
         (helper  (quotient curr-n 10) (add1 digits))
     )
  )
  ;helper call
  (helper n 0)
)



(define (dig-pow n p)
  (define (calculate-abcd curr-n curr-p num)
    (if (= 0 curr-n)
        num
        (calculate-abcd (quotient curr-n 10) (sub1 curr-p) (+ num (expt (remainder curr-n 10) curr-p)))
    )
  )

  ;after the number has been found. calculate if its divisible by n and if yes return the result k
  (define (find-k abcd)
    (if (= (remainder abcd n) 0)
        (quotient abcd n)
        -1
    )
  )

  ;helper calls
  (find-k (calculate-abcd n (+ p (sub1 (num-digits n))) 0))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(= (dig-pow 89 1) 1)
(= (dig-pow 92 1) -1)
(= (dig-pow 695 2) 2)
(= (dig-pow 46288 3) 51)