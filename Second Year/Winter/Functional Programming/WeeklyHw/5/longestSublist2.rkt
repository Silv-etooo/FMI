#lang racket
#|
   Week 5. Task 2
   --------------
   Define a procedure longest-ascending-sub xs that returns the
   longest sublist (sequence of consecutive elements) that is
   sorted in ascending order from xs.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helper functions


; sublist
; -------
; given: a list xs
; returns: sublist (sequence of consecutive elements) that is
;          sorted in ascending order from xs
(define (sublist xs)
  (define (helper curr-xs new-xs)
    (cond
      ;base
      ;end of curr-cs
      [(null? curr-xs) new-xs]
      ; curr-elem > next elem
      [(> (car new-xs) (car curr-xs) )  new-xs]

      ;recursive call
      [else (helper (cdr curr-xs) (cons (car curr-xs) new-xs))]
    )
   )
  (if (= 1 (length xs))
      xs
      (reverse (helper (cdr xs) (list (car xs))))
  )
)

; longert-list
; --------------
; given: two lists
; returns: longer one
(define (longer-list xs1 xs2)
  (if (< (length xs1) (length xs2))
         xs2
         xs1
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (longest-ascending-sub xs)
  (define (helper curr-xs curr-longest-sub-xs)
    ;loop every sublist with start ith element
    ;base
    (if(null? curr-xs)
       curr-longest-sub-xs
       ;recursive call
       (helper
            (cdr curr-xs)
            (longer-list (sublist curr-xs) curr-longest-sub-xs)
        )
    )
  )
  
  (helper xs '())
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (longest-ascending-sub '(1 0 5)) '(0 5))
(equal? (longest-ascending-sub '(1 5 2 3 1 5 6 7 7 1 5)) '(1 5 6 7 7))
(equal? (longest-ascending-sub '(1 5 2 3 1 5 2 7 7 15)) '(2 7 7 15))
(equal? (longest-ascending-sub '(1 5 2 3 4 5 6 7 7 1 5)) '(2 3 4 5 6 7 7))
(equal? (longest-ascending-sub '(1 5 2 4 6 8 3 4 1)) '(2 4 6 8))
