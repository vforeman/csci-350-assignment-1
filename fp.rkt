

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
  ;handle the empty list
  (if (null? L)
      0 ;if not given a list then return 0
      (if (or (list? (car L)) (not (number? (car L)))); if the element is a list or nan
          (+ 0 (sum-up-numbers-simple (cdr L)));if the element is a list then add 0 to the sum of the remaining list
          (+ (car L) (sum-up-numbers-simple (cdr L)));else add that element to the recursive sum of the remaining list
      )
  )
)

(define (sum-up-numbers-general L)
  ;handle the empty list
  (if (null? L)
      0 ;if not given a list then return 0
      (if (list? (car L)); if the element is a list 
          (+ (sum-up-numbers-general (car L)) (sum-up-numbers-general(cdr L)));if the element is a list then add general sum of that list to the sum of the remaining list

          (if (not (number? (car L))); if elem 1 is nan
              (+ 0 (sum-up-numbers-general (cdr L)));then add 0 to the sum
              (+ (car L) (sum-up-numbers-general(cdr L)));else add that element to the recursive sum of the remaining list
          )
          
      )
  )
)  

(define (min-above-min L1 L2)
 (cond 
   (
    (and (not (null? L1)) (not (null? L2)));neither list null
    (cond ;compare elements
     (
      (and (number? (car L1)) (number? (smallest-num-from-list-simple L2))); case: num-num
      (if (> (car L1) (smallest-num-from-list-simple L2)); if num1 > num2
          (if (and (not (null? (cdr L1))) (number? (car (cdr L1))))
              (if (<= (car L1) (car (cdr L1))); if l1[0] < l1[1]
                  (min-above-min (append (cdr (cdr L1)) (list (car L1))) (list (smallest-num-from-list-simple L2)));then cycle the first list and recall
                  (min-above-min (cdr L1) (list (smallest-num-from-list-simple L2)));else pop elem1 and recall
              )
              (min-above-min L1 '());else this is the last elemen in l1 so recall with l2 null
          )
         (min-above-min (cdr L1) (list (smallest-num-from-list-simple L2)));else pop elem1 and recall
       )
      )
     (
      (and (number? (car L1)) (not (number? (smallest-num-from-list-simple L2)))); case: num-nan
      (min-above-min L1 '());then recall with l2 null
      )
     (
      (and (not (number? (car L1))) (number? (smallest-num-from-list-simple L2))); case: nan-num
      (min-above-min (cdr L1) (list (smallest-num-from-list-simple L2)));then pop elem1 and recall
      )
     (
      (and (not (number? (car L1))) (not (number? (smallest-num-from-list-simple L2)))); case: nan-nan
      (min-above-min (cdr L1) '());then pop both elems and recall
     )
    )
   )
   (
    (and (null? L1) (not (null? L2)));l1 null
    #f
   )
   (
    (and (not (null? L1)) (null? L2));l2 null
    (smallest-num-from-list-simple L1);return the smallest elem from l1
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
(define (largest-num-from-list-simple L);given a list, return the largest num
  (if (null? L)
      #F
      (if (not(number? (car L))) ;if the first elem is not a num
          (largest-num-from-list-simple (cdr L)); pop it off and recall
          (if (null? (cdr L));else if theres only one element in the list and it is a number now
              (car L);then return that number
              (if (or (not (number? (car (cdr L)))) (> (car L) (car (cdr L)) ));if the 2nd elem is not a number or if the 1st elem is larger than the 2nd elem
                  (largest-num-from-list-simple (append (cdr (cdr L)) (list (car L))));then append elem1 to the end and pop off the 2nd elem before recalling
                  (largest-num-from-list-simple (cdr L));else pop the 1st element
              )
          )
      )
  )
)




