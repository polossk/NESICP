(load "testing_for_primality.scm")

(define (pseudoprime? n)
    (define (pseudoprime-iter cnt)
        (cond ((>= cnt n) #t)
            ((= (expmod cnt n n) cnt) (pseudoprime-iter (+ cnt 1)))
            (else #f)))
    (pseudoprime-iter 1))

(define (timed-pseudoprime-test n)
    (start-pseudoprime-test n (runtime)))

(define (start-pseudoprime-test n start-time)
    (if (pseudoprime? n) (report-pseudoprime n (- (runtime) start-time))))

(define (report-pseudoprime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time)
)

(define (pick-a-pseudoprime n)
    (cond ((= n 0) 561)
          ((= n 1) 1105)
          ((= n 2) 1729)
          ((= n 3) 2465)
          ((= n 4) 2821)
          ((= n 5) 6601)
          (else 2)))

(define (test-for-pseudoprime cnt)
    (cond ((>= cnt 6) (display "\ndone\n"))
          (else (timed-pseudoprime-test (pick-a-pseudoprime cnt))
                (test-for-pseudoprime (+ cnt 1)))))

(test-for-pseudoprime 0)
; 561 *** .01
; 1105 *** .02
; 1729 *** 3.0000000000000006e-2
; 2465 *** .04999999999999999
; 2821 *** .07
; 6601 *** .15999999999999998
; done
