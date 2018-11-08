#lang racket

;A. Display in sorted order the contents of a binary search tree
;B. Return #t or #f if a given item is present or absent in a tree or not. The function should take the item and a list representing a tree.
;C. Insert an item correctly into a list representing a binary search tree. Your function should take an item and a tree as inputs.
;D. Take a list of items and insert them into a binary search tree.
;E. Implement a tree-sort algorithm. Your function should take a list of items and display them in sorted order.
;F. Implement a higher order version of the tree-sort function that takes a list and a function that determines the sorted order. For example, write a version that sorts the list in ascending, descending and ascending based on last digit.



(provide display-btree-sorted)
(define (display-btree-sorted)

)

(provide search-btree)
(define (search-btree element tree)

)

(provide btree-insert)
(define (btree-insert element tree)

)

(provide btree-insert-list)
(define (btree-insert-list l tree)

)

(provide tree-sort)
(define (tree-sort l tree)

)

(provide tree-sort-ho)
(define (tree-sort-ho tree sortfunction)

)