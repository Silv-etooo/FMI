#lang racket
(require racket/trace)
#|
   Week 5. Task 1
   --------------
   Define a procedure that removes an element from a list.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; има и начин без my-reverse, ама не мога да се сетя

(define (my-reverse xs)
  (define (helper curr-xs new-xs)
    (if(null? curr-xs)
       new-xs
       (helper (cdr curr-xs) (cons (car curr-xs) new-xs))
    )
   )
  (helper xs '())
)


(define (remove-all-no-proc x xs)
  (define (helper curr-xs new-xs)
    (cond
      ;base
      [(null? curr-xs) new-xs]
      ;top elem == x
      [(equal? (car curr-xs) x)  (helper (cdr curr-xs) new-xs)  ]
      ;top elem != x
      [else  (helper (cdr curr-xs) (cons (car curr-xs) new-xs  )) ]
     )
   )
  ;(trace helper)
  (my-reverse (helper xs '()))
)

(define (remove-all-proc x xs)
  (remq* (list x) xs)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases

; without using a predefined procedure
(equal? (remove-all-no-proc 1 '(1 1 1 2)) '(2))
(equal? (remove-all-no-proc 1 '(2 5 6)) '(2 5 6))
(equal? (remove-all-no-proc 1 '(1)) '())
(equal? (remove-all-no-proc 1 '(1 2 1 1)) '(2))
(equal? (remove-all-no-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN"))

; using a predefined procedure
(equal? (remove-all-proc 1 '(1 1 1 2)) '(2))
(equal? (remove-all-proc 1 '(2 5 6)) '(2 5 6))
(equal? (remove-all-proc 1 '(1)) '())
(equal? (remove-all-proc 1 '(1 2 1 1)) '(2))
(equal? (remove-all-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN"))