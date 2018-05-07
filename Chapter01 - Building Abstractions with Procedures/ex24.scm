(load "testing_for_primality.scm")

(define (timed-fast-prime-test n)
    (start-fast-prime-test n (runtime)))

(define (start-fast-prime-test n start-time)
    (if (fast-prime? n 1000) (report-fast-prime n (- (runtime) start-time))))

(define (report-fast-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time)
)

(define (pick-a-prime n)
    (cond ((= n  0) 1000000007)
          ((= n  1) 1000000009)
          ((= n  2) 1000000021)
          ((= n  3) 1000000033)
          ((= n  4) 10000000019)
          ((= n  5) 10000000033)
          ((= n  6) 10000000061)
          ((= n  7) 10000000069)
          ((= n  8) 100000000003)
          ((= n  9) 100000000019)
          ((= n 10) 100000000057)
          ((= n 11) 100000000063)
          (else  2)))

(define (test-for-fast-primes cnt)
    (cond ((>= cnt 12) (display "\ndone\n"))
          (else (timed-fast-prime-test (pick-a-prime cnt))
                (test-for-fast-primes (+ cnt 1)))))

(test-for-fast-primes 0)
; 1000000007 *** 6.0000000000000005e-2
; 1000000009 *** .07
; 1000000021 *** .06
; 1000000033 *** .07
; 10000000019 *** .07
; 10000000033 *** .06999999999999995
; 10000000061 *** .08000000000000002
; 10000000069 *** .07000000000000006
; 100000000003 *** .08999999999999997
; 100000000019 *** .07999999999999996
; 100000000057 *** .08999999999999997
; 100000000063 *** .09000000000000008
; done

; (fast-prime? n 1000) => O(log n)
; n ->   10n ->  100n
; t -> 1.16t -> 1.42t
