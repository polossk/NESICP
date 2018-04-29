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

(sqrt 0.001) ; => 0.04124542607499115, which should be 0.0316227766
(sqrt 1e9) ; => 31622.776601684047, correct

(define (much-good-enough? guess x)
    (< (abs (- guess x)) (* 0.001 x)))

(define (good-sqrt-iter prev-guess curr-guess x)
    (if (much-good-enough? prev-guess curr-guess)
        curr-guess
        (good-sqrt-iter curr-guess (improve curr-guess x) x)))

(define (good-sqrt x) (good-sqrt-iter 0 1.0 x))

(good-sqrt 0.001) ; => 0.03162278245070105
(good-sqrt 1e9) ; => 31622.780588899368

(define (test-old-err x)
    (- (square (sqrt x)) x))

(test-old-err 0.001) ; => 0.0007011851721075595
(test-old-err 1e9) ; => 0.00001609325408935547

(define (test-err x)
    (- (square (good-sqrt x)) x))

(test-err 0.001) ; => 3.699243660958834e-10
(test-err 1e9) ; => 252.1736706495285
