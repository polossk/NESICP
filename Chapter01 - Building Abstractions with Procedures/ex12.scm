#!/usr/bin/mit-scheme

(define (pascal levels)
    (define (binomial n k)
        (cond ((= n 0) 1)
            ((= k 0) 1)
            ((= k n) 1)
            (else (+ (binomial (- n 1) (- k 1)) (binomial (- n 1) k)))
        )
    )
    (define (item now total)
        (display " ")
        (display (binomial total now))
        (cond ((= now total) (display "\n"))
            (else (item (+ now 1) total))
        )
    )
    (define (level now total)
        (item 0 now)
        (cond ((= now total) (display "\n"))
            (else (level (+ now 1) total))
        )
    )
    (display "\n")
    (level 0 (- levels 1))
)

(pascal 5)

(pascal 3)

(pascal 2)

(pascal 1)