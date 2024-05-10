; Define variable 'a' with value 1
(define a 1)

; Define variable 'b' with value 2
(define b 2)

; Define a function 'double' that takes a parameter 'x' and returns 'x' multiplied by 2
(define double
  (lambda (x)
    (* 2 x)))

; Call the 'double' function with the value of 'a' (1) and display the result (2)
(double a)

; Call the 'double' function with the value 10 and display the result (20)
(double 10)

