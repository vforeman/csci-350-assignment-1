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
 (cond
   (
    (and (number? (smallest-num-from-list-simple L1)) (number? (smallest-num-from-list-simple L2))); case: num-num
    (if (> (smallest-num-from-list-simple L1) (smallest-num-from-list-simple L2)); if num1 < num2
        (smallest-num-from-list-simple L1);then return num1
        (smallest-num-from-list-simple L2);else return num2
    )
   )
   (
    (and (number? (smallest-num-from-list-simple L1)) (number? (smallest-num-from-list-simple L2))); case: num-nan
    (smallest-num-from-list-simple L1);then return num1
   )
   (
    (and (number? (smallest-num-from-list-simple L1)) (number? (smallest-num-from-list-simple L2))); case: nan-num
    (smallest-num-from-list-simple L2);else return num2
   )
   (
    (and (number? (smallest-num-from-list-simple L1)) (number? (smallest-num-from-list-simple L2))); case: nan-nan
    #f;then return #f
   )
 ) 
)

(define (smallest-num-from-list-simple L);given a list, return the smallest num
  (if (null? L)
      #F
      (if (not(number? (car L))) ;if the first elem is not a num
          (smallest-num-from-list-simple (cdr L)); pop it off and recall
          (if (null? (cdr L));else if theres only one element in the list and it is a number now
              (car L);then return that number
              (if (or (not (number? (car (cdr L)))) (< (car L) (car (cdr L)) ));if the 2nd elem is not a number or if the 1st elem is smaller than the 2nd elem
                  (smallest-num-from-list-simple (append (cdr (cdr L)) (list (car L))));then append elem1 to the end and pop off the 2nd elem before recalling
                  (smallest-num-from-list-simple (cdr L));else pop the 1st element
              )
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
  ;(display "test four")(newline)
  ;(smallest-num-from-list-simple testlist3)

)
