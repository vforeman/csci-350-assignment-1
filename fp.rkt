(define testlist '(1 2 3 (1 2 3) (4 5 6))); test list
(define testlist2 '((1 2 3) 100 200 (1 2 3)))
(define testlist3 '(a 300 b 100 c 200 d))
(define testlist4 '(a 200 b 300 c 100 d))

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
;Write a function (sum-up-numbers-simple L). L is a list, which may contain
;as elements numbers and non-numbers. The result of the function is the sum of the numbers
;not in nested lists in L. If there are no such numbers, the result is zero. For example, the result
;of (sum-up-numbers-simple ‘(a b 1 2 c 3 d)) should be 6.
(define (sum-up-numbers-simple L)
  ;handle the empty list
  (if (null? L)
      0 ;if not given a list then return 0
      (if (list? (car L))
          (+ 0 (sum-up-numbers-simple (cdr L)));if the element is a list then add 0 to the sum of the remaining list
          (+ (car L) (sum-up-numbers-simple (cdr L)));else add that element to the recursive sum of the remaining list
      )
  )
)

(define (sum-up-numbers-general L)
  ;handle the empty list
  (if (null? L)
      0 ;if not given a list then return 0
      (if (list? (car L))
          (+ (sum-up-numbers-general (car L)) (sum-up-numbers-simple (cdr L)));if the element is a list then add general sum of that list to the sum of the remaining list
          (+ (car L) (sum-up-numbers-simple (cdr L)));else add that element to the recursive sum of the remaining list
      )
  )
)  

(define (min-above-min L1 L2)
  (if (null? L1)
      #f ; if L1 is null then return false
      ; else check if the first elements in each list are numbers
      (cond
        (;dealing with 2 numbers
         (and (number? (car L1)) (number? (car L2)));if the elements popped from the lists are both numbers
           (display "elem 1:\t")(display (car L1))(newline)
           (display "elem 2:\t")(display (car L2))(newline)
           (if (< (car L1) (car L2)); if the first element is smaller than or equal to the second element
             (min-above-min L1 (cdr L2)); then popped the larger, second element off and recall the func
             (min-above-min (cdr L1) L2);else pop the element larger,first element off and recall
           )
        )
        (;dealing with only one number
         (or (and (not (number? (car L1))) (number? (car L2)))  (and (not (number? (car L2))) (number? (car L1))))
           (display "elem 1:\t")(display (car L1))(newline)
           (display "elem 2:\t")(display (car L2))(newline)
           (if (not (number? (car L1))); if the first element is not a number
             (min-above-min (cdr L1) L2); then popped element 1
             (min-above-min L1 (cdr L2));else pop the element 2
           )
          
        )
        (;dealing with 2 non-numbers
         (and (not (number? (car L1))) (not (number? (car L2)))) 
           (display "elem 1:\t")(display (car L1))(newline)
           (display "elem 2:\t")(display (car L2))(newline)
           (min-above-min (cdr L1) (cdr L2));pop both elements
          
        )
      )
  )
)


(define (atom? x) 
  (and (not (pair? x))
       (not (null? x))))


(define (test)
  ;(display "test one")(newline)
  ;(reverse-general testlist)
  ;(display "test two")(newline)
  ;(sum-up-numbers-simple testlist2)
  ;(display "test two")(newline)
  ;(sum-up-numbers-general testlist2)
  (display "test three")(newline)
  (min-above-min testlist3 testlist4)

)
