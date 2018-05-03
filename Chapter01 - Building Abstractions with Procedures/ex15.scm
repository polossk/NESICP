(define (cube x) (* x x x))

(define (p x)
    (display " (*)")
    (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

(sine 12.15) ; (*) (*) (*) (*) (*) => -.39980345741334

; T(N) = O(1) + T(N/3) => T(N) = O(log N)
