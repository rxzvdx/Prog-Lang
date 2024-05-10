; Equality checking in scheme
; = checks that two numbers are Equality
; eq? checks that two names refer to the same obj
; equal? checks that two names refer to equivalent objects (works for lists, pairs, strings)

(define lstx '(1 2 3 ))
(define lsty '(1 2 3))
(define empty-list '())
(define hstr "Hello")

"="
(= 3 3)				; #t
(= 9 8) 			; #f
(= 6 ( * 2 3))		; #t
( = 6 '6)			; #t

(newline)
"eq?"
(eq? 1 1)						; #t
(eq? '2 2) 						; #t
(eq? 1 "1")						; #f
(eq? '1 (car '(1 2 3)))			; #t
(equal? '(2 3) (cdr '(1 2 3)))	
(eq? lstx lsty)
(eq? empty-list '())
(eq? empty-list '())
(eq? "Hello" (symbol-> 'Hello))

(newline)
"string=?"
(string=? "Hello" (symbol->string 'Hello))		; #f
(string=? hstr "Hello")							; #t

