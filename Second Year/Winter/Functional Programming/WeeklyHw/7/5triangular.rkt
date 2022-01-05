#lang racket
#|
    Седмица 7. Задача 5
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (triangular? mat)
  ;go though row
  (define (check-row column xs)
    (if (= (length (filter zero? (take xs column)))   (length (take xs column))  )   
        #t
        #f
    )    
  )


  ;go though every column
  (define (helper size curr-column curr-xs)
    (cond
      ;base (went though all columns 
      [(= size curr-column) #t]
      ;check row
      [(equal?  (check-row curr-column (car curr-xs)) #f) #f]
      ;next column
      [else (helper size (add1 curr-column) (cdr curr-xs))]
     )
        
  )
  
 
  
  (helper (length mat) 0 mat)
 
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (triangular? '((1 2 3)
                       (0 5 6)
                       (0 0 9))) #t)

(equal? (triangular? '((0 2 3)
                       (0 0 6)
                       (1 0 0))) #f)

(equal? (triangular? '((1 2 3)
                       (1 5 6)
                       (0 0 9))) #f)

(equal? (triangular? '((1 2 3 4)
                       (0 5 6 7)
                       (0 0 8 9)
                       (0 0 0 9))) #t)