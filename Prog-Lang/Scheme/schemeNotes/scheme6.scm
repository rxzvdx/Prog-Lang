; Imperative style:
;	x = something
; 	y = change(x)
;	result = calculatr(y)

; Functional style:
;	calculate(change(something))

(define x 10)
(define y 20)

"Defining procedures"
(* 3 x) 					; Scheme form
(lambda (x) (* 3 x))
((lambda (x) (* 3 x)) 5) 	; returns 3 * 5
((lambda (x) (* 3 x)) x)
(define trip (lambda (x) (* 3 x)))
trip
(trip 5)
(trip x)

(newline)
"Define a predicate to check if a value is an atom"
(define atom?
	(lambda (x)
		(and (not (pair x)) (not (null? x)))))
(atom? 3)				; #t
(atom? "Atom")			; #t
(atom? (cons 1 2))		; #f
(atom? (list 1 2 3))	; #f

"Define a procedure with 2 parameters"
(define addem
	(lambda (a b)
		(+ a b)))
addem
(addem x y)					; 30
(addem 10 (addem 20 30)		; 60 

"Increment function"
(define Increment
	(lambda (x)
		(* x 1)))
(increment 8)
(increment (increment (increment (increment 0))))

(newline)
"Function as a parameter"
(define do 
	(lambda (this that)
		(this that)))
(do increment 10)					; 11
(do - 20)							; -20
(do trip 27)						; 81
(do integer? 8)						; #t
(do (lambda (x) (* x (+ x i))) 3)	; 12
(do 10 20)							; 10 is not a procedure

(newline)
"Conditionals"
(if (> 3 2) 'bigger 'smaller)		; bigger
(if (< 3 2) 'bigger 'smaller)		; smaller
(if (= x 10) (+ x 5) (do trip x))	; 15
(if (= x 12) (+ x 5) (do trip x))	; 30 
