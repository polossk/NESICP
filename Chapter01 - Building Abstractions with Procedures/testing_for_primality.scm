(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((= (remainder n test-divisor) 0) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= 0 (remainder b a)))

(define (prime? n) (= (smallest-divisor n) n))
