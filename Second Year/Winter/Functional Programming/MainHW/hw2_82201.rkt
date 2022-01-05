#lang racket
#|
   Домашна 2. Задача 1
   -------------------
   Да се дефинира процедура от по-висок ред (itinerary flights), която
   приема списък от точкови двойки, представящи самолетни пътувания във вида
   (<начало>.<край>), и връща унарна процедура, приемаща начално летище -
   такава, че оценката на обръщение от вида ((itinerary flights) start) да
   е лексикографски най-малката последователност от пътувания, която включва
   всички дадени пътувания точно по веднъж (възможно е да се премине през едно
   летище повече от веднъж). В случай, че такава не съществува, да се връща
   индикация за грешка.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                                  ; IDEA

; make a list with all possible permutations
; choose the right one
;
; defining right one:
;   1. лексикографски най-малката
;   2. последователност от пътувания
;   3. включва всички дадени пътувания точно по веднъж 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                             ; HELPER PROCEDURES

#| procedure: find-paths
   ----------------------------------
   върнем списък, който е
   2. последователност от пътувания
|#
(define (find-paths xxs start)
  ;helper
  (define (valid-path? curr-xs curr-start)
    (cond
      [(null? curr-xs)   #t]
      [(not(equal? curr-start (caar curr-xs) )) #f ]
      [else (valid-path? (cdr curr-xs) (cdar curr-xs))]
    )
  )
  ;call
  ;филтритаме пермутацията като оставяме само последователните пътувания
  (filter (λ (xs) (valid-path? xs start)) xxs)
)

#| procedure: find-shortest-path
   ----------------------------------
   върнем списък, който е
   1. лексикографски най-малката
   2. последователност от пътувания
|#
(define (find-shortest-path xxs start)
  ;helper
  (define (lexicograph-order curr-xs curr-ys)
    (cond
      [(null? curr-xs) curr-xs]
      [(string<? (caar curr-xs) (caar curr-ys)) curr-xs ]
      [(string<? (caar curr-xs) (caar curr-ys)) curr-ys ]
      [else (lexicograph-order (cdr curr-xs) (cdr curr-ys))]
    )
  )

  ;error-check
  (define (error-check xs)
     (if (null? xs)
         (error "No such itinerary!")
         xs
     )     
   )

  ;call
  ;сортираме лексикографски списъка и избираме първата подредба
  (car (error-check
    (sort
        (find-paths xxs start) ; тук се изпълнява 2.
        (lambda (x y) (lexicograph-order x y))
    )
  ))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                             ;MAIN PROCEDURE

#| procedure: itinerary
   ----------------------------------
   върнем списък, който е
   1. лексикографски най-малката
   2. последователност от пътувания
   3. включва всички дадени пътувания точно по веднъж 
|#
(define (itinerary xs)
  ;helper
  (define (format curr-xs new-xs)
    (cond
      [(null? curr-xs) new-xs]
      [else (format (cdr curr-xs) (cons new-xs  (cdar curr-xs))  )]
    )
  )
    
  ;call
  ;намираме пътуванията и ги форматираме
  (lambda (start)
    (flatten (format
               (find-shortest-path (permutations xs) start) ;като правим пермутация 3. е изпълнено
               (list start)
              )
    )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? ((itinerary '(("SFO" . "HKO") ("YYZ" . "SFO") ("YUL" . "YYZ") ("HKO" . "ORD"))) "YUL") '("YUL" "YYZ" "SFO" "HKO" "ORD"))
(equal? ((itinerary '(("A" . "B") ("A" . "C") ("B" . "C") ("C" . "A")))"A") '("A" "B" "C" "A" "C"))
;((itinerary '(("SFO" . "COM") ("COM" . "YYZ"))) "COM") ; error "No such itinerary!"








#|
   Домашна 2. Задача 2
   -------------------
   Да се дефинира процедура от по-висок ред (pad xs), която приема матрица xs
   и връща унарна процедура, приемаща число x - такава, че оценката на 
   обръщение от вида ((pad xs) x) да е нова матрица, в която xs е заградена
   от x.
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     ; IDEA
; 3 different function
; 1st puts padding on top of the matrix by adding a list with size = length list+2
; 2nd puts padding at the beggingin and end of every list
; 3st puts padding on top of the matrix by adding a list with size = length list+2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                 ; MAIN PROCEDURE
(define (pad xs)
  ; 1ST
  (define (top-pad x size)
     (make-list size x)
  )
  ; 2ND
  (define (bottom-pad x size)
       (top-pad x size)
  )
  ; 3ND
  (define (middle-pad xs x)
       (map (λ (elem) (append (list x) elem (list x))) xs)
  )
  
   (lambda (x)
      (append
        (list (top-pad x (+ 2 (length xs)) ))
        (middle-pad xs x)
        (list (bottom-pad x (+ 2 (length xs))))
      )
   )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;test cases
(equal? ((pad '( (1 2 3)
                 (4 5 6)
                 (7 8 9) )
                ) 0)
        '( (0 0 0 0 0)
           (0 1 2 3 0)
           (0 4 5 6 0)
           (0 7 8 9 0)
           (0 0 0 0 0) ))

(equal? ((pad '( (1 2 3)
                 (4 5 6)
                 (7 8 9) )
              ) 9)
        '( (9 9 9 9 9)
           (9 1 2 3 9)
           (9 4 5 6 9)
           (9 7 8 9 9)
           (9 9 9 9 9) ))