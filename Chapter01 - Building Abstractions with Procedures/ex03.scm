(define (square x) (* x x))
; CAUTION: may be overflow
(define (sum-without-min a b c)
    (- (+ (square a) (square b) (square c))
       (square (min a b c))))

(sum-without-min 5 6 7) ; => 85 (36 + 49)

(sum-without-min 7 8 9) ; => 145 (64 + 81)

(sum-without-min 6 6 6) ; => 72 (36 + 36)
