(define testlist '(1 2 3 (1 2 3) 4 5 6)); test list

(define (reverse-general L)
  (if
    (null? L); if null then return nil
    '()
    (
     append (reverse-general (cdr L)) (list (car L))
    ); return the cons of the cdr and car
  )
  
)


(define (test)
  (display "test one")(newline)
  (reverse-general testlist)
  ;(display (list L (newline)))
  ;(reverse-general 'nil)
)
