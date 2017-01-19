(define testlist '(1 2 3 (1 2 3) 4 5 6)); test list

(define (reverse-general L)
  (if
    (null? L); if null then return nil
    (list 'nil (display (newline)))
    (cdr L); return the cdr
  )
  
)


(define (test)
  (display "test one")(newline)
  (reverse-general testlist)
  ;(display (list L (newline)))
  ;(reverse-general '())
)
