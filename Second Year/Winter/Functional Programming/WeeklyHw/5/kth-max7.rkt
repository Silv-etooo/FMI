#lang racket
#|
    Week 5. Question 7
    -------------------
    Define a procedure that accepts a list of numbers and
    returns an unary procedure of a natural number - k,
    such that the result from a call to it (the new procedure)
    is the kth largest negative number in the list.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (kth-max-min xs)
  (define (helper curr-xs k)
    (if (= 1 k)
        (car curr-xs)
        (helper (cdr curr-xs) (sub1 k))
     )
  )

 
  (λ (k)
    (if(< (helper (remove-duplicates(sort xs <)) k) 0) ; и тук като в по-предишната задача как мога да не го пресмятам 2 пъти?
       (helper (remove-duplicates(sort xs <)) k)
       (error (" error: No such number!"))
    )
  )

)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(= ((kth-max-min '(-1)) 1) -1)
(= ((kth-max-min '(-1 -5 -6 -6 -6 -6)) 2) -5)
(= ((kth-max-min '(1 2 3 4 -5 6 7 -2 -1 0)) 2) -2)
;((kth-max-min '(-1 0 -1 0 -2 3 1 -1)) 3) ; error: No such number!