(define (expmod base exp m)
    (remainder (fast-expt base exp) m))

; This function will recive a overflow error when the base^exp exceed the
; maxinum int limit. For example (fast-expt 2 1000).
