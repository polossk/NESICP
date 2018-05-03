(define (f x)
    (if (< x 3)
        x
        (+ (f (- x 1)) (* 2 (f (- x 2))) (* 3 (f (- x 3))) )))

(define (f-iter f1 f2 f3 n)
    (cond ((= n 0) f1)
          ((= n 1) f2)
          ((= n 2) f3)
          (else (f-iter f2 f3 (+ f3 (* 2 f2) (* 3 f1)) (- n 1)))))

(define (f2 x) (f-iter 0 1 2 x))

(f2 4)

(- (f 4) (f2 4))

(f2 5)

(- (f 5) (f2 5))
