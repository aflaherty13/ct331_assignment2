#lang racket
(require rackunit)
(require rackunit/gui)

(require (file "assignment_q2.rkt"))

(test/gui
 (test-suite
  "CT331 Assignment 2 - Question 2, Unit Tests"
  (test-suite
   "ins_beg tests"
   (test-case "inserted element appears at the start of the list"
              (check-equal? (ins_beg 1 '(2 3 4)) '(1 2 3 4) "element inserted incorrectly")
   )
  )
   
  (test-suite
   "ins_end tests"
   (test-case "inserted element should appear at the start of the list"
       (check-equal? (ins_end 1 '(2 3 4)) '(2 3 4 1) "element inserted incorrectly")
   )
   (test-case "inserting null element should return original list"
       (check-equal? (ins_end 1 '(2 3 4)) '(2 3 4 1) "element inserted incorrectly")
   )
  )
  
  (test-suite
   "count_top_level tests"
   (test-case "should only count elements"
             (check-equal? (count_top_level '(a (a b c) b c)) 3))
   (test-case "empty list should return 0"
              (check-equal? (count_top_level '()) 0))
   (test-case "sub list should not be counted"
              (check-equal? (count_top_level '((a b c))) 0))
   )

  (test-suite
   "count_instances tests"
   (test-case "should count elements "
              (check-equal? (count_instances 'a '(a b a) ) 2))
   (test-case "should not count elements in sub lists"
              (check-equal? (count_instances 'a '(a b (a (a)) a) ) 2))
   (test-case "should return 0 for an empty list"
              (check-equal? (count_instances 'a '() ) 0))
   (test-case "should return 0 for an empty sub list"
              (check-equal? (count_instances 'a '(()) ) 0))
   )

  ; how do we test if something is tail recursive in code
  (test-suite
   "count_instances_tr tests"
   (test-case "should tail recurse"
              (check-equal? (count_instances_tr_i 'a '(a b a) 2) 4)
   )

   (test-case "should count elements "
              (check-equal? (count_instances_tr 'a '(a b a) ) 2))
   (test-case "should not count elements in sub lists"
              (check-equal? (count_instances 'a '(a b (a (a)) a) ) 2))
   (test-case "should return 0 for an empty list"
              (check-equal? (count_instances_tr 'a '() ) 0))
   (test-case "should return 0 for an empty sub list"
              (check-equal? (count_instances_tr 'a '(()) ) 0))
   )

  ; 
  (test-suite
   "count_instances_deep tests"

      (test-case "should count elements "
              (check-equal? (count_instances_deep 'a '(a b a) ) 2))
      (test-case "should count sub-lists"
              (check-equal? (count_instances_deep 'a '(a b a (a b c) (a b c) (a b c (a b c)) a)) 7 ) 
              )
      (test-case "should return 0 for an empty list"
              (check-equal? (count_instances_deep 'a '()) 0)
              )
      (test-case "should return 0 for an empty sub-list"
              (check-equal? (count_instances_deep 'a '(())) 0 )
              )
   )
  )
)
