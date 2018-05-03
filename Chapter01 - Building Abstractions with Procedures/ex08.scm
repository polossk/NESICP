(define (cubic x) (* x x x))

(define (improve guess x)
    (/ (+ (/ x guess guess) (+ guess guess)) 3))

(define (good-enough? guess x)
    (< (abs (- guess x)) (* 0.001 x)))

(define (cbrt-iter prev-guess curr-guess x)
    (if (good-enough? prev-guess curr-guess)
        curr-guess
        (cbrt-iter curr-guess (improve curr-guess x) x)))

(define (cbrt x) (cbrt-iter 0 1.0 x))

(define (test-err x) (- (cubic (cbrt x)) x))

(cbrt 9) ; => 2.0800838232385224
(cbrt 1e9) ; => 1000.0000002636338

(test-err 9) ; => 2.4223503203302243e-9
(test-err 1e9) ; => 0.7909011840820312
