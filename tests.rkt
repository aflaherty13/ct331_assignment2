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
   (test-case "initial test" (fail "unimplemented"))
   )
  (test-suite
   "count_top_level tests"
   (test-case "initial test" (fail "unimplemented"))
   )

  (test-suite
   "count_instances tests"
   (test-case "initial test" (fail "unimplemented"))
   )
  
  (test-suite
   "count_instances_tr tests"
   (test-case "initial test" (fail "unimplemented"))
   )

  (test-suite
   "count_instances_deep tests"
   (test-case "initial test" (fail "unimplemented"))
   )
  ))