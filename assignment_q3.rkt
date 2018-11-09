#lang racket

; notes
; btree node format '(value (-l-)(-r-))
; this should be inserted as '(value ()()) when inserting new elements

(provide display-btree-sorted)
(define (display-btree-sorted tree)
  (if (null? tree)
      (display "") ; replace with void or is there a better construct <- terminal position
      (begin 
       (display-btree-sorted (cadr tree))
       (printf "~a " (car tree))
       (display-btree-sorted (caddr tree))
      )
   )
)

(printf "A) Display in sorted order the contents of a binary search tree~n~n")
(printf "    Using the binary search tree:~n~n")
(printf "           15~n")
(printf "         12   20~n")
(printf "        5~n~n")
(printf "    in list format:~n")
(printf "   '(15 (12 (5 () ()) ()) (20 () ()))~n~n")
(printf "  1. Print the contents of the tree in sorted order~n")
(display-btree-sorted '(15 (12 (5 () ()) ()) (20 () ())))

(provide search-btree)
(define (search-btree tree element)
  ; base case is null or we find the element
  (if (null? tree)
      #f
      (cond
        [(eq? element (car tree)) #t]
        [(< element (car tree))
         (search-btree (cadr tree) element )] ; left 
        [(> element (car tree))
         (search-btree (caddr tree) element)] ; right
        )
    )
)

(printf "~n~n~nB) Return #t or #f if a given item is present or absent in a tree or not. The function should take the item and a list representing a tree.~n")
(printf "    Using the binary search tree:~n~n")
(printf "           15~n")
(printf "         12   20~n")
(printf "        5~n~n")
(printf "    in list format:~n")
(printf "   '(15 (12 (5 () ()) ()) (20 () ()))~n~n")
(printf "  1. Search for 2 in btree: ~a~n" (search-btree '(15 (12 (5 () ()) ()) (20 () ())) 2))
(printf "  2. Search for 15 in btree: ~a~n" (search-btree '(15 (12 (5 () ()) ()) (20 () ())) 15))
(printf "  3. Search for 100 in btree: ~a~n~n" (search-btree '(15 (12 (5 () ()) ()) (20 () ())) 100))

(provide btree-insert)
(define (btree-insert tree element)
  (if (null? tree)
      (list element '() '())
      (cond [(eq? element (first tree)) tree]  ; element already exists
            [(< element (first tree))
             (list (first tree) (btree-insert (cadr tree) element) (caddr tree)) ; search left
             ]
            [(> element (first tree))
             (list (first tree) (cadr tree) (btree-insert (caddr tree) element)) ; search right
             ]
            )
  )
)

(printf "~nC) Insert an item correctly into a list representing a binary search tree. Your function should take an item and a tree as inputs.~n")
(printf "    Using the same binary search tree from earlier:~n~n")
(printf "  1. Insert 2: ~n~a~n~n" (btree-insert '(15 (12 (5 () ()) ()) (20 () ())) 2))
(printf "  2. Subsequently insert 21, 10, 17, 9 : ~n~a~n~n" (btree-insert(btree-insert(btree-insert(btree-insert(btree-insert '(15 (12 (5 () ()) ()) (20 () ())) 2) 21) 10) 17) 9) )

(provide btree-insert-list)
(define (btree-insert-list tree l)
  (if (empty? l) tree
        (btree-insert-list (btree-insert tree (first l)) (rest l))
   )
)
(printf "~n~nD) Take a list of items and insert them into a binary search tree.~n")
(printf "  Using the same binary search tree from earlier:~n~n")
(printf "  1. Insert 2, 21, 10, 17, 9: ~n~a~n~n" (btree-insert-list '(15 (12 (5 () ()) ()) (20 () ())) '(2 21 10 17 9)))

(provide tree-sort)
(define (tree-sort l)
  (display-btree-sorted (btree-insert-list '() l))
)
(printf "~n~nE) Implement a tree-sort algorithm. Your function should take a list of items and display them in sorted order.~n~n")
(printf "   1. Tree sort '(50 3 10 3 100 30 15 60 12 1 3 4 5 9)~n")
(tree-sort '(50 3 10 3 100 30 15 60 12 1 3 4 5 9))

(provide tree-sort-ho)
(define (tree-sort-ho tree sort-function)
  0
)

(printf "~n~nF) Implement a higher order version of the tree-sort function that takes a list and a function that determines the sorted order. For example, write a version that sorts the list in ascending, descending and ascending based on last digit.~n~n")
(printf "   1. Tree sort '(50 3 10 3 100 30 15 60 12 1 3 4 5 9)~n")
(tree-sort-ho sort-ascending '(50 3 10 3 100 30 15 60 12 1 3 4 5 9))

(define (sort-ascending param1 param2)
  (cond [(eq? param1 param2) 0]
        [(< param1 param2) -1]
        [(> param1 param2) 1])
)

(define (sort-descending param1 param2)
  (cond [(eq? param1 param2) 0]
        [(< param1 param2) 1]
        [(> param1 param2) -1])
)

(define (sort-last-digit param1 param2)
  (let ([key1 (last-digit param1)])
  (let ([key2 (last-digit param2)])
  (cond [(eq? key1 key2) 0]
        [(< key1 key2) -1]
        [(> key1 key2) 1])
  ))
)

(define (last-digit num)
  (- num (* (floor (/ num 10)) 10))
)
