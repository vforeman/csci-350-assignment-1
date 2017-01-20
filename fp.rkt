(define testlist '((1 2 3) (4 5 6))); test list

(define (reverse-general L)
  (if
    (null? L); if null then return nil
    '()
    (if (list? (car L))
        ;(append (reverse-general (cdr L)) (reverse-general (car L)) ); return the cons of the cdr and car

        (reverse-general (car L) ); return the cons of the cdr and car
        (append (reverse-general (cdr L)) (list (car L)) ); return the cons of the cdr and car

    )
  )
  
)

(define (atom? x) 
  (and (not (pair? x))
       (not (null? x))))


(define (test)
  (display "test one")(newline)
  (reverse-general testlist)
  ;(display (list L (newline)))
  ;(reverse-general 'nil)
)
