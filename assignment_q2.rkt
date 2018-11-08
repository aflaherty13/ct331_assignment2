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
(provide count_instances_tr_i)    ;eek, exposing internal functionality to test
(provide count_instances_deep)

(define (ins_beg element l )
  (println "ins_beg")
  (printf "~a : ~a~n" element l)
  (cons element l)
)

(define (ins_end element l )
  (println "ins_end")
  (printf "~a : ~a~n" element l)
  (append l (list element))
)

(define (count_top_level l )
  (println "count_top_level")
  (printf "~a~n" l)
  (count (or symbol? number?) l)
)

(define (count_instances element l )
  (println "count_instances")
  (printf "~a : ~a~n" element l)
  (count_instances_i element l)
)

(define (count_instances_i element l )
; (println "count_instances_i")
  (printf "~a : ~a~n" element l)
  (if (null? l) 0
    (if (eq? (first l) element)
      (+ (count_instances_i element (rest l)) 1)
      (count_instances_i element (rest l))
     )
  )
)

(define (count_instances_tr element l )
  (println "count_instances_tr")
  (printf "~a : ~a~n" element l)
  (count_instances_tr_i element l 0)
)

(define (count_instances_tr_i element l n )
;  (println "count_instances_tr_i")
  (printf "~a (~a) : ~a~n" element n l)
  (if (null? l) n
   (if (eq? (first l) element)
    (count_instances_tr_i element (rest l) (+ n 1))
    (count_instances_tr_i element (rest l) n)
   )
  )
)

(define (count_instances_deep element l )
;  (printf "count_instances_deep:~a~n" l)
  (printf "~a : ~a~n" element l)
  (if (null? l) 0
     (cond [(list? (first l))
           ; return sum first l and rest l
           ( +
           (count_instances_deep element (first l))
           (count_instances_deep element (rest l))
           )]
          [else (if (eq? (first l) element)
              (+ (count_instances_deep element (rest l)) 1)
              (count_instances_deep element (rest l))
              )
          ]
      )
  )
)
