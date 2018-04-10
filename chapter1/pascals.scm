; Pascals Triangle
; TODO: Add a test method to print the pascals triangle
; Ex: 1.12

( define (pascals row column)
    (cond ( (or (< row 0) (< column 0)) 0)
          ( (= row column) 1)
          ( (or (= row 0) (= column 0)) 1)
          ( else (+  (pascals (- row 1) column) (pascals (- row 1) (- column 1)
             )))
    )
)     

