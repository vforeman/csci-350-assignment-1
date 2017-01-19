(define L (list '(1 2 3 (1 2 3) 4 5 6))); test list

(define (reverse-general L)
  (if
    (null? L); if null then return nil
    (list 'nil (display (newline)))
    L; else append the 1st element to the end of the list
  )
  
)


(define (test)
  (display "test one")(newline)
  (reverse-general L)
  ;(display (list L (newline)))
  ;(reverse-general '())
)
