#lang racket
#|
   Homework 4. Task 2
   Define a procedure repeater str that accepts a string and
   returns a procedure of two arguments - count (number) and
   glue (string). The result from a call to repeater should
   be a string that is str repeated count times with glue
   being put between every two str instances.

|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (repeater str)
  (define (helper count glue new-str)
      (if(= count 1)
         new-str
         (helper (sub1 count) glue (string-append new-str glue str ))
       )
  )

  (lambda (count glue)
    (helper count glue str)
  )


)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? ((repeater "I love Racket") 3 " ") "I love Racket I love Racket I love Racket")
(equal? ((repeater "Quack") 5 "!") "Quack!Quack!Quack!Quack!Quack")