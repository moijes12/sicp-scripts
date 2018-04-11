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

; Adding implementation of factorial method to compute factorial using
; product implementations
(define (factorial n)
    (define (identity a) a)
    (define (inc b) (+ b 1))
    ; Using product-recursive in place of product-iterative below
    ; will also work
    (product-iterative identity 1 inc n)
)
