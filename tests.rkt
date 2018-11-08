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
   (test-case "inserted element should appear at the start of the list" (fail "unimplemented"))
   (test-case "initial test" (fail "unimplemented"))
   )
  (test-suite
   "count_top_level tests"
   (test-case "count should be correct" (fail "unimplemented"))
   (test-case "count should not include items in a sub list" (fail "unimplemented"))
   )

  (test-suite
   "count_instances tests"
   (test-case "initial test" (fail "unimplemented"))
   (test-case "count should include items in a sub list" (fail "unimplemented"))
   (test-case "count should include items in a sub list ((((a b c) a)) b (((a b c))))" (fail "unimplemented"))

   )

  ; how do we test if something is tail recursive in code
  (test-suite
   "count_instances_tr tests"
   (test-case "initial test" (fail "unimplemented"))
   )

  ; 
  (test-suite
   "count_instances_deep tests"
   (test-case "initial test" (fail "unimplemented"))
   )
  ))