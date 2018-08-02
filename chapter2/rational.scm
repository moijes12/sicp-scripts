;; Ex2.1
;; Define a better version of make-rat that handles both positive and negative arguments. Make-rat should normalize the sign so
;; that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is
;; negative, only the numerator is negative

(define (gcd a b)
  (cond
      ((> b a) (gcd b a))
      ((= b 0) a)
      (else (gcd b (- a b)))
  )
)

(define (make-rat n d)
  (define absn (abs n))
  (define absd (abs d))
  (define sign (/ (* absn absd) (* n d)))
  (let ((g (gcd absn absd)))
      (cons (* sign (/ absn g)) (/ absd g))
  )
)

(define (numer x)
  (car x)
)

(define (denom x)
  (cdr x)
)
