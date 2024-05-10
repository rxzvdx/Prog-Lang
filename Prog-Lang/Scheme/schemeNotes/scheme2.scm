; Literals
"Hello World"	; String
10				; Integer
3.14			; Real
'HelloWorld		; Symbol

; Scheme uses prefix notation: the operator comes first
(+ 1 2) ; 1 + 2 = 3
(sqrt (+ (* 4 4) (* 3 3))) ; square root of (3 * 3) + (4 * 4) 

; Associate the value 5 with the name "x"
(define x 5)
(* 2 x) 
; x = 5, 2 * x, x is now 10 

; Define a new function
(define half-it
	(lambda (x)
		(/ x 2))) ; Halves a given number
; in scheme48: (half-it 20) = 10

; Lists 
(list 1 2 3 4)
	(define lst (list 1 2 3 4)) ; lst = (1 2 3 4)
	(define lst2 '(a b c d)) ; The quote tells Scheme not to evaluate what is in parens
; Leave names so scheme can evaluate 
lst 
lst2 
; Note that (1 2 3 4) will not work because 1 is not an operation

; List appending
(append (list 1 2 3 4) '(5 6 7 8)) ; result: (1 2 3 4 5 6 7 8) 
