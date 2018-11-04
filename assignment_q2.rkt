#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

(define (ins_beg element l )
  (println "ins_beg")
  (cons element l)
)

(define (ins_end element l )
  (println "ins_end")
  (append l (list element))
)

(define (count_top_level l )
  (println "count_top_level")
  (count (or symbol? number?) l)
)

(define (count_instances element l )
  (println "count_instances")
  (count_instances_i element l)
)

(define (count_instances_i element l )
  (if (null? l) 0
    (if (eq? (first l) element)
      (+ (count_instances_i element (rest l)) 1)
      (count_instances_i element (rest l))
     )
  )
)

(define (count_instances_tr element l )
  (print "count_instances_tr")
)

(define (count_instances_deep element l )
  (print "count_instances_deep")
)

; Notes: last one deep recursion... not count_instances
;(define (count_instances_i element l i  )
;  ; TODO: rewrite to count the instances of the elements in a list and sum the
;  ; count from the calling code, returning that to the
;  
;  (cond [(null? l)]
;        [(list? (first l))
;         (printf "found list ~n~a~ni: ~a~n" (first l) i)
;         (count_instances_i element (first l) i)
;         (count_instances_i element (rest l) i)]
;        [else
;          (cond [(eq? (first l) element)        ; if its a list it should not be an element... but we could pass '(a b) and '(a b '(a b)) to function.... 
;                 (printf "found element ~nfirst: ~a~nrest: ~a~ni: ~a~n" (first l) (rest l) i)
;                 (count_instances_i element (rest l) (+ i 1))]
;                [else
;                 (printf "element not found ~nfirst: ~a~nrest: ~a~ni: ~a~n" (first l) (rest l) i)
;                 (count_instances_i element (rest l) i)])
;
;          ])
;  i
;)
