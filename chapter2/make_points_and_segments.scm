;; Ex2.2
;; Make points, segments and get the midpoints of the segment

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define (midpoint segment)
    (let ((average (lambda (x y) (/ (+ x y) 2.0))))
        (make-point
            (average (x-point (start-segment segment)) (x-point (end-segment segment)))
            (average (y-point (start-segment segment)) (y-point (end-segment segment)))
        )
    )
)

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
)

(define start (make-point 2 3))
(define end (make-point 4 6))

(print-point start)
(print-point end)
(print-point (midpoint (make-segment start end)))

