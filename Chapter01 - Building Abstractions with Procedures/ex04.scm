#!/usr/bin/mit-scheme

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

(a-plus-abs-b 5 -4) ; => (- 5 -4) => 9
(a-plus-abs-b 5 4)  ; => (+ 5 4) => 9
