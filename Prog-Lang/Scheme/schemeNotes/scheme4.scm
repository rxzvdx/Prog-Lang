; A Scheme form is something that you ask Scheme to evaluate
1
"Hello, world!"
(+ 1 2)
(+ 1 2 3 4)
(- 1 (-3 -2) (+ -4 5)) 
#; (comment out an entire form)
#; (Define i-am-ignored
	(lambda(x)
		(* x 0)))
		
(define mynumber 10) ; can do things like (+ mynumber3) but mynumber can never be changed from 10
(define myname "Wade")
(string? myname) ; returns true as val of myname is a string

(newline) ; evaluates to an empty line
"Data Types"
1				; integer
3.4 			; real num
"Hello, World"	; string
* 				; primitive
#t				; boolean
#f				; boolean
#\am-ignored	; characters

(newline)
"Symbols & Strings"
(symbol? "Hello") ;#f "Hello" is a string
(symbol? 'World) ;#t 'World is a symbol
(string? "Hello") ; #t
(string? 'World) ;#f
(symbol->string 'hello) ; converts symbol to string

(newline)
"Numeric data types:"
3			; integer
#b101		; binary
#o101		; octal
#x101		; hexadecimal
12.3		; real
7.3			; fractions
4+2i		; imaginary

(newline)
"Number predicates"
(integer? 3)
(integer? 3.0)
(integer? (* 3 1/3))
(integer? (* 3(/ 1 3)))

"Real"
(real? 3)
(real? 3.0)
(real? 2+i)
(real + 2+0i)

"Other"
(rational? 1/3)
(complex? 2+i)
(complex? 2+0i)
(complex? 2)
(rational? 2+0i)
(number? 3)
(number? 2+i)
(number? (car '(8 10 5)))
(number? "One")
(number? 'Two)
(number '3)

(newline)
"Math"
(+ 10 10)
( * 10 10)
(+ 1 2)
(* 3 4)
(- 1)
(- -1)
(+ 1 2 3 4 5 6 7 8 9 10)
(* 1 2 3 4 5 6 7 8 9 10)
(- 1 2 3 4 5 6 7 8 9 10)
(/ 100 2 5)
(sqrt 9)
(sqrt 20)
(sqrt -1)
(/ 17 3) 
(quotient 17 3)
(remainder 17 3)

(newline)
"Define x, y, z"
(define x 10)
(define y 20)
(define (z) 30)
x
y
z
(+ 2 x)
(+ x 2)
(* x(/ y 6))
( = x 12)
(< x 12)

(newline)
"Checking Equality"
(define num 8)
"="
(= 32 32)
(= 32 = (* 4 num))
(= 8 num)
"eq?"
(eq? 'Hello 'Hello)
(eq? "World" "World)
