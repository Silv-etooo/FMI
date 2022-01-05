#lang racket
#|
   Домашно 7. Задача 1
   Define a predicate that takes two non-empty lists of lists of numbers. If xss = '(xs1 .. xsn) and
   yss = '(ys1 .. ysn) the procedure should return whether all pairs of elements (xsi, ysi) have
   equal lengths.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (compare-pair-lengths xss yss)
  (define (helper curr-xss curr-yss)
    (cond
      ;base
      [(null? curr-xss) #t]
      [(not(equal? (length (car xss)) (length (car yss)))) #f ]
      ;reqursive call
      [else (helper (cdr curr-xss) (cdr curr-yss))]
    )

  )
  (helper xss yss)
)

(define (have-matching-lengths xss yss)
  (if (equal? (length xss) (length yss))
      (compare-pair-lengths xss yss)
      #f
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;test cases
(equal? (have-matching-lengths '((1 2 3) (4 5 6) (7 8 9)) '((1 4 7) (2 5 8) (3 6 9))) #t)
(equal? (have-matching-lengths '((1 2)) '((1 4 7) (2 5 8))) #f)