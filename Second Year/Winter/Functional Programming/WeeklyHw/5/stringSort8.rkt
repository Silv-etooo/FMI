#lang racket
#|
    Week 5. Question 8
    -------------------
    Take 2 strings s1 and s2 including only letters from
    a to z. Return a new sorted string, the longest possible,
    containing distinct letters - each taken only once -
    coming from s1 or s2.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (longest s1 s2)
  (list->string
   (sort
    (remove-duplicates
      (flatten
      (cons (string->list s1) (string->list s2)))
     )
     char<?
   )
  )


)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? (longest "xyaabbbccccdefww" "xxxxyyyyabklmopq") "abcdefklmopqwxy")
(equal? (longest "abcdefghijklmnopqrstuvwxyz" "abcdefghijklmnopqrstuvwxyz") "abcdefghijklmnopqrstuvwxyz")