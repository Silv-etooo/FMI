#lang racket
#|
    Week 3. Task 3
    Define a procedure that accepts two numbers - x and n,
    and calculates the nth partial sum from the following
    sequence:
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( define (divizitor n)
   ( define (helper n sum)
      (if (zero? n)
          sum
          (helper (sub1 n) (* sum  (+ 3 (* 2 (sub1 n) ))   ) ) ; 3 + 2(n-1)
      )
   )
   (helper n 1)
)



( define (calc-series-sum x n)
   ( cond
      [(zero? n) -2]
      [ else ( +
               (/ (* (expt -1  (add1 n)) (expt x n)  (expt 2  (add1 n)))    
                    (divizitor n)
               )   
               (calc-series-sum x (sub1 n))
             )
      ]
   )
)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; task cases
(calc-series-sum 1 0) ; -2
(calc-series-sum 1 1) ; -2/3
(calc-series-sum 1 2) ; -1 1/5
(calc-series-sum 1 3) ; -1 1/21
(calc-series-sum 1 4) ; -1 11/135
(calc-series-sum 1 5) ; -1 29/385
(calc-series-sum 1 6) ; -1 937/12285