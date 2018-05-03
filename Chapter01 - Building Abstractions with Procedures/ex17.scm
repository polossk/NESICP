(define (fast-mult a b)
    (cond ((= b 1) a)
          ((even? b) (fast-mult (+ a a) (/ b 2)))
          (else (+ a (fast-mult a (- b 1))))))

(fast-mult 17954 13543) ; => 243151022
