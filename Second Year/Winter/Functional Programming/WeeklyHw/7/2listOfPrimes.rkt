#lang racket
(require math/number-theory)
#|
   Домашно 7. Задача 2
   Define a procedure that accepts a natural number n and returns an unary function of k which
   returns a list of the numbers between 1 and n (inclusive) such that no number contains k or more
   prime divisors.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (add-n-if-contains-less-than-k-prime-divisitors n k xs)
  (if (< (length (remq n  (prime-divisors n))) k) 
      (append xs (list n))
      xs
  )
)

(define (numbers n)
  (define (helper curr-n k xs)
    (if (= (sub1 curr-n) n)
        xs
        (helper (add1 curr-n) k (add-n-if-contains-less-than-k-prime-divisitors curr-n k xs))
    )
  )

  (lambda (k)
    (helper 1 k '())
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;test cases
(equal? ((numbers 10) 1) '(1 2 3 5 7))
(equal? ((numbers 20) 2) '(1 2 3 4 5 7 8 9 11 13 16 17 19))