(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (* (expmod base (/ exp 2) m)
                                     (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

; This function will deduct the (* x x) to the specific way of it, which
; indicating that the T(n) = T(n/2) + T(n/2), while the (square x) will
; deduct the T(n) = T(n/2) in the other way.
