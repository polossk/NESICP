(define (fast-mult-iter a b c)
    (cond ((= b 0) c)
          ((even? b) (fast-mult-iter (+ a a) (/ b 2) c))
          (else (fast-mult-iter a (- b 1) (+ a c)))))

(define (fast-mult a b) (fast-mult-iter a b 0))

(fast-mult 17954 13543) ; => 243151022
