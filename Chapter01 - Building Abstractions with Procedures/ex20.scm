(define (gcd a b)
    (if (= b 0) a (gcd b (remainder a b))))

(gcd 206 40)
; ## using % as alias of remainder in comment text
; # applicative-order evaluation
(gcd 206 40) ; => (if (= 40 0) 206 (gcd 40 (% 206 40))) => (gcd 40 (% 206 40))
(gcd 40 6) ; => (if (= 6 0) 40 (gcd 6 (% 40 6))) => (gcd 6 (% 40 6))
(gcd 6 4) ; => (if (= 4 0) 6 (gcd 4 (% 6 4))) => (gcd 4 (% 6 4))
(gcd 4 2) ; => (if (= 2 0) 4 (gcd 2 (% 4 2))) => (gcd 2 (% 4 2))
(gcd 2 0) ; => (if (= 0 0) 2 (gcd 0 (% 2 0))) => 2
; it called remainder 4 times.

; # normal-order evaluation
; for any (gcd aa bb) => (if (= bb 0) aa (gcd bb (% aa bb)))
(gcd 206 40)
; => (if (= 40 0) 206 (gcd 40 (% 206 40)))
(gcd 40 (% 206 40))
; => (if (= (% 206 40) 0) 40 (gcd (% 206 40) (% 40 (% 206 40))))
(gcd (% 206 40) (% 40 (% 206 40))) ; # +1
; => (if (= (% 40 (% 206 40)) 0) (% 206 40) (gcd (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))))
(gcd (% 40 (% 206 40)) (% (% 206 40) (% 40 (% 206 40)))) ; # +2
(let a1 (% 40 (% 206 40)))
(let b1 (% (% 206 40) (% 40 (% 206 40))))
; => (if (= b1 0) a1 (gcd b1 (% a1 b1)))
(gcd b1 (% a1 b1)) ; # +4
; => (if (= (% a1 b1) 0) b1 (gcd (% a1 b1) (% b1 (% a1 b1))))
(b1) ; # +7
(% (% 206 40) (% 40 (% 206 40))) ; # +4
; it called remainder (+ 1 2 4 7 4) times
