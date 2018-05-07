(define (nontrivial-sqrt? x m)
    (cond ((= x 1) #f)
          ((= x (- m 1)) #f)
          (else (= (remainder (square x) m) 1))))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (let ((x (expmod base (/ exp 2) m)))
            (if (nontrivial-sqrt? x m) 0 (remainder (square x) m))))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test? n) (= 1 (expmod (random (- n 1)) (- n 1) n)))

(define (miller-rabin? n)
    (define (miller-rabin-iter cnt)
        (cond ((= cnt 0) #t)
              ((fermat-test? n) (miller-rabin-iter (- cnt 1)))
              (else #f)))
    (miller-rabin-iter 100)
)

(define (timed-miller-rabin-test n)
    (start-miller-rabin-test n (runtime)))

(define (start-miller-rabin-test n start-time)
    (newline)
    (display n)
    (display " => ")
    (display (miller-rabin? n))
    (display " *** ")
    (display (- (runtime) start-time))
)

(define (pick-a-number n)
    (cond ((= n  0) 561)
          ((= n  1) 1105)
          ((= n  2) 1729)
          ((= n  3) 2465)
          ((= n  4) 2821)
          ((= n  5) 6601)
          ((= n  6) 10000000061)
          ((= n  7) 10000000069)
          ((= n  8) 100000000003)
          ((= n  9) 100000000019)
          ((= n 10) 100000000057)
          ((= n 11) 100000000063)
          (else  2)))

(define (test-for-miller-rabin cnt)
    (cond ((>= cnt 12) (display "\ndone\n"))
          (else (timed-miller-rabin-test (pick-a-number cnt))
                (test-for-miller-rabin (+ cnt 1)))))

(test-for-miller-rabin 0)
; 561 => #f *** .02
; 1105 => #f *** 0.
; 1729 => #f *** 0.
; 2465 => #f *** 0.
; 2821 => #f *** 0.
; 6601 => #f *** 0.
; 10000000061 => #t *** 9.999999999999998e-3
; 10000000069 => #t *** 1.0000000000000002e-2
; 100000000003 => #t *** 1.9999999999999997e-2
; 100000000019 => #t *** 1.0000000000000009e-2
; 100000000057 => #t *** 9.999999999999995e-3
; 100000000063 => #t *** 2.0000000000000004e-2
; done
