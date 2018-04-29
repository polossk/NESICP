(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (sqrt x) (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
    (else else-clause)))

(define (sqrt-iter2 guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter2 (improve guess x) x)))

; the evaluation neither applicative-order way nor normal-order
; way will expand this new-if function to itself, then the
; interpreter will report a stack overflow error of your code