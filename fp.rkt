(define testlist '(1 2 3 (1 2 3) (4 5 6))); test list
(define testlist2 '(100 200))

(define (reverse-general L)
  (if
    (null? L) 
    '() ; if null, return an empty list
    (if (list? (car L)) ;check if the head element in the list is also a list
        (append ;if the popped element is also a list, then we are dealing with 2 lists that each need to be reversed
         (reverse-general (cdr L)) ;reverse the remaining list
         (list
          (reverse-general (car L));also reverse the popped list
         )
        ); return the cons of the cdr and car
        ;(reverse-general (car L) ); return the cons of the cdr and car
        (append;if the popped element is not a list, then only the remaining list need to reveresd, the popped element is an atom
         (reverse-general (cdr L));reverse the remaining list
         (list
          (car L);no need to reverse a single atom
         )
        ); return the cons of the cdr and car
    )
  )
  
)

(define (sum-up-numbers-simple L)
  1
)


(define (atom? x) 
  (and (not (pair? x))
       (not (null? x))))


(define (test)
  ;(display "test one")(newline)
  ;(reverse-general testlist)
  (display "test two")(newline)
  (sum-up-numbers-simple testlist2)
)
