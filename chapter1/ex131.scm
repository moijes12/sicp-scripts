; Ex 1.31
; Write a procedure called product that returns the product of the values of
; a function over a given range

; An implementation of a higher-order procedure to compute product over a
; range.
; This procedure evolves a recursive process.
(define (product-recursive term a next b)
    (if (> a b) 1 
        (* (term a) (product-recursive term (next a) next b))
    )
)

; An implementation of a higher-order procedure to compute product over a 
; range.
; This procedure evolves a iterative process.
(define (product-iterative term a next b)
    (define (iter a result)
        (if (> a b) result (iter (next a) (* (term a) result)))
    )
    (iter a 1)
)

; Defining the identity and incrementer function which will be used in 
; factorial and in approximation of pi
(define (identity a) a)

(define (inc b) (+ b 1))

; Adding implementation of factorial method to compute factorial using
; product implementations
(define (factorial n)
    ; Using product-recursive in place of product-iterative below
    ; will also work
    (product-iterative identity 1 inc n)
)

; Using product to compute the approximations to pi using the formula
; pi / 4 = (2 * 4 * 4 * 6 * 6 * 8 * 8 * ...) / (3 * 3 * 5 * 5 * 7 * 7 * ...)
; This is according to Wallis' formula see 
; https://en.wikipedia.org/wiki/Wallis_product
; The solution below has largely been copied from
; http://www.billthelizard.com/2010/05/sicp-exercise-131-product-of-series.html
; The solution I had come up with did not scale though it did work for values 
; of n till 84.  
(define (pi n)
    ; n is the number of terms to which we wish to approximate
    (define (square n) (* n n))
    (define (term_numerator n) (* 4.0 (square n)))
    (define (term_denominator n) (- (* 4.0 (square n)) 1))
    (define (term n) (/ (term_numerator n) (term_denominator n)))
    (* 2.0 (product-recursive term 1 inc n))
)

; An implementation which comes close to the exact series asked in the 
; question 
(define (pi2 n)
    ; n is the number of terms to which we wish to approximate
    (define (square n) (* n n))
    (define (double n) (* 2 n))
    (define (term_numerator k)
        (if (or (= k 1)(= k n)) (double k) (square (double k)))
    )
    (define (term_denominator k)
        (if (= k n) 1 (square (+ (double k) 1)))
    )
    (define (term n) (/ (* 1.0 (term_numerator n)) (term_denominator n)))
    (* 4.0 (product-iterative term 1 inc n))
)
