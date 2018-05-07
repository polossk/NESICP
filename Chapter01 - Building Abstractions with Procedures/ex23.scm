(load "testing_for_primality.scm")

(define (next test-divisor)
    (cond ((= 2 test-divisor) 3)
        (else (+ test-divisor 2))))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((= (remainder n test-divisor) 0) test-divisor)
          (else (find-divisor n (next test-divisor)))))

(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n) (report-prime n (- (runtime) start-time)) #f))

(define (report-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time)
    #t
)

(define (search-for-primes a b cnt)
    (cond ((or (>= a b) (>= cnt 10)) (display "\ndone\n"))
          ((even? a) (search-for-primes (+ a 1) b cnt))
          (else (let ((flag (timed-prime-test a)))
                (search-for-primes (+ a 2) b (if flag (+ 1 cnt) cnt))))))

(search-for-primes 1e9 1e10 0)
; 1000000007. *** 4.9999999999999996e-2
; 1000000009. *** .05
; 1000000021. *** .05000000000000002
; 1000000033. *** .04999999999999999
; 1000000087. *** .04999999999999999
; 1000000093. *** .04999999999999999
; 1000000097. *** .04999999999999999
; 1000000103. *** .04999999999999999
; 1000000123. *** .04999999999999993
; 1000000181. *** .06000000000000005
; done

(search-for-primes 1e10 1e11 0)
; 10000000019. *** .16000000000000003
; 10000000033. *** .15000000000000002
; 10000000061. *** .1499999999999999
; 10000000069. *** .15000000000000013
; 10000000097. *** .15000000000000013
; 10000000103. *** .1499999999999999
; 10000000121. *** .1499999999999999
; 10000000141. *** .15000000000000013
; 10000000147. *** .1499999999999999
; 10000000207. *** .1499999999999999
; done

(search-for-primes 1e11 1e12 0)
; 100000000003. *** .46999999999999975
; 100000000019. *** .46999999999999975
; 100000000057. *** .46999999999999975
; 100000000063. *** .4600000000000004
; 100000000069. *** .47999999999999954
; 100000000073. *** .46999999999999975
; 100000000091. *** .47000000000000064
; 100000000103. *** .47999999999999954
; 100000000129. *** .4800000000000004
; 100000000171. *** .4800000000000004
; done

; O(sqrt(N))
; test: n ->  10n -> 100n
; old:  t ->   3t ->  10t
; new:  t -> 1.5t ->   5t
