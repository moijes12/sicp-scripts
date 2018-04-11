; Ex 1.32
; Show that sum and product are both special cases of a still more general
; notation called acumulate that combines a collection of terms using some
; general accumulation function

(define (accumulate-recursive combiner null-value term a next b)
    (if (> a b) null-value
        (combiner (term a) (accumulate-recursive combiner null-value term (next a) next b))
    )
)

(define (accumulate-iterative combiner null-value term a next b)
    (define (iter a result)
        (if (> a b) result
            (iter (next a) (combiner (term a) result))
        )
    )
    (iter a null-value)
)

; Example usage
; Let's use the accumulate procedure to define a procedure to compute
; factorial
(define (factorial n)
    (define (identity x) x)
    (define (inc a) (+ a 1))
    ; We can also use the accumulate-recursive procedure in place of the 
    ; below procedure
    (accumulate-iterative * 1 identity 1 inc n)
)

(factorial 10)
