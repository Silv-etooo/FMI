#lang racket
#| Homework 1. Task 1
     Да се дефинира процедура (sum-counts-iter x d), която
     връща сбора на цифрите на броя срещания на цифрата d
     в числата от интервала [1,x] (x е естествено число).
     Процедурата да реализира линейно итеративен процес.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;връща сбора на цифрите
(define (sum-digits-iter x)
  (define (helper curr-x curr-sum)
    ;base
    (if (< curr-x 10)
        (+ curr-sum (remainder curr-x 10))
        ;recursive call
        (helper (quotient curr-x 10) (+ curr-sum (remainder curr-x 10) ))
    )
  )
  ;error check and helper call
  (if (< x 0)
      (error "x is negative")
      (helper x 0)
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; броя срещания на цифрата d в число
(define (count-occurences num digit)
  (define (helper curr-num digit num-of-occurrences)
    ;base
    (if (<= curr-num 0)
        num-of-occurrences
        ;recursive call
        (if (= digit (remainder curr-num 10))
               (helper (quotient curr-num 10) digit (+ num-of-occurrences 1))
               (helper (quotient curr-num 10) digit num-of-occurrences)
        )
    )
  )
  ;eroor check and helper call
  (if( < num 0)
      (error "Negative number!")
      (helper num digit 0)
   )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (sum-counts-iter x d)
  (define (helper curr-x sum)
    ;base
    (if (= curr-x x)
        (sum-digits-iter (+ sum (count-occurences curr-x d)))
        ;recursive call
        (helper (add1 curr-x) (+ sum   (count-occurences curr-x d) ) ) 
    )
  )
  (helper 0 0 )
)

;end of task 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#| Homework 1. Task 2
     Да се дефинира процедура (add-ones n), която прибавя 1 към
     всяка цифра на неотрицателното число n. В случай, че се
     добавя 1 към 9, вместо да се извършва пренасяне на 1, в
     новото число да се записва 10.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; конкатенира 2 числа
(define (concatenate left-num right-num right-num-digits)
   (+ (* left-num (expt 10 right-num-digits )) right-num)
)
; брой цифрите в число
(define (count-digits n)
  (if (< n 10)
      1
      (add1 (count-digits (quotient n 10)))
      )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;прибавя 1 към цифра
(define (special-add d new-n)
  (if (zero? new-n)
      (add1 d)
      (concatenate (add1 d) new-n (count-digits new-n))
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( define (add-ones n)
   ( define (helper curr-n new-n)
      ;base
      ( if (zero? curr-n)
           new-n
           ;recursive call
           (helper
                (quotient curr-n  10)
                (special-add (remainder curr-n 10) new-n)
            )
      )
   )
   (helper n 0)
)
;end of task 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
