#lang racket
#|
    Week 3. Task 2
    By using find-max and remove-first-occurrence, define a
    procedure that sorts a number in descending order.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; previous functions
; find-max
(define (find-max n)
  (define (helper current-n max)
    (cond
      [(zero? current-n) max]
      [(> (remainder current-n 10) max) (helper (quotient current-n 10) (remainder current-n 10))]
      [else (helper (quotient current-n 10) max)]
      )
  )
  (helper (quotient n 10) (remainder n 10))
)
; remove-first-occurrence
( define (concatenate left-num right-num right-num-digits)
   (+ (* left-num (expt 10 right-num-digits )) right-num)
)
( define (remove-first-occurrence num d)
   ( define (helper left-num right-num right-num-digits d)
      ;base
      ( if (= (remainder left-num 10) d)
           (concatenate (quotient left-num 10) right-num right-num-digits)
           ;recursive call
           (helper
                (quotient left-num 10)
                (concatenate (remainder left-num 10) right-num  right-num-digits)
                (add1 right-num-digits)
                d
           )
      )
   )
   (helper num 0 0 d)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (num-of-zeros num)
  (define (helper curr-num num-zeros)
    (cond
      [(zero? curr-num) num-zeros]
      [(zero? (remainder curr-num 10))  (helper (quotient curr-num 10)  (add1 num-zeros))          ]
      [else  (helper (quotient curr-num 10)   num-zeros)     ]
    ) 
  )
  (helper num 0)
)



(define (sort-n num)
  (define (helper curr-num sort-num)
    ;base
    (if (zero? curr-num)
        sort-num
        ;recursive call
        (helper
         (remove-first-occurrence curr-num (find-max curr-num))
         (+ (* sort-num 10) (find-max curr-num))
        )
    )
  )
  (*   (helper num 0)   (expt 10 (num-of-zeros num)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; task cases
(= (sort-n 1714) 7411)
(= (sort-n 123450) 543210)
(= (sort-n 123405) 543210)
(= (sort-n 123045) 543210)
(= (sort-n 120345) 543210)
(= (sort-n 102345) 543210)
(= (sort-n 8910) 9810)
(= (sort-n 321) 321)
(= (sort-n 29210) 92210)
(= (sort-n 1230) 3210)
(= (sort-n 55345) 55543)
(= (sort-n 14752) 75421)
(= (sort-n 329450) 954320)
(= (sort-n 9125) 9521)