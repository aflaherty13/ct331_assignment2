#lang racket

(provide questionOne)

(define (questionOne)
  ; this is a cons pair (2 . 1)
  (printf "1. cons pair:~n~a~n'~a~n~n"
          "(cons 2 1)"                   
          (cons 2 1)
          )
  ; list is null terminated.
  (printf "2. cons list of 3 items:~n~a~n'~a~n~n"
          "(cons 2 (cons 1 '())"
          (cons 2 (cons 1 '()))          
  )
  ; cons appends only one item per call, multiple cons calls are required along with the null terminator, or empty list '().
  (printf "3. 'cons' list:~n~a~n'~a~n~n"
          "(cons \"A String\" (cons 2 (cons '(1 2 3) '())))"
          (cons "A String" (cons 2 (cons '(1 2 3) '())))
          )
  ; list appends multiple arguments into a single list
  (printf "4. 'list' list:~n~a~n'~a~n~n"
          "(list \"A String\" 2 '(1 2 3))"
          (list "A String" 2 '(1 2 3))
          )
  ; append appends multiple lists into one, arguments must already be lists.
  (printf "5. 'append' list:~n~a~n'~a~n~n"
          "(append '(\"A String\") '(2) '((1 2 3)))"
          (append '("A String") '(2) '((1 2 3)))
          )
)