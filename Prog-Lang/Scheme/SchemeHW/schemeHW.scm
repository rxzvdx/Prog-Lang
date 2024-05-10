; Function to compute the agreement-score between a voter and a candidate
(define (compute-agreement-score voter-answers candidate-answers)
	; initialize the score to 0
  (let ((score 0))
	; iterate over the voter's answers and the candidate's answers
    (do ((v voter-answers (cdr v))
         (c candidate-answers (cdr c)))
		 ; repeat until the end of the list
        ((null? v) score)
		; compare the voter's answer (car v) with the candidate's answer (car c)
      (cond
		; if they are the same, add 10 to the score
        ((= (car v) (car c)) (set! score (+ score 10)))
		; if both manners are in the set {1, 2}, add 5 to the score
        ((and (<= (car v) 2) (<= (car c) 2)) (set! score (+ score 5)))
		; if both answers are in the set {3, 4}, add 5 to the score
        ((and (>= (car v) 3) (>= (car c) 3)) (set! score (+ score 5)))))))

; function to find the candidates with the best agreement score
(define (find-best-candidates voter-answers candidate-data)
	; initialize variables to store the best score and the names of the best candidates
  (let ((best-score 0)
        (best-candidates '()))
	; iterate over each dandidate in the candidate data
    (for-each
     (lambda (candidate)
		; compute the agreement score between the voter and the candidate
       (let ((score (compute-agreement-score voter-answers (cdr candidate))))
		; update the best score and best candidates if the current candidate has a higher score
         (if (> score best-score)
             (begin
               (set! best-score score)
               (set! best-candidates (list (car candidate))))
			  ; if the current candidate has the same score as the best score, add their name to their list
             (if (= score best-score)
                 (set! best-candidates (cons (car candidate) best-candidates))))))
     candidate-data)
	 ; return the list of names of the best candidates
    best-candidates))

; wrapper function to call find-best-candidates
(define (best-candidates voter-answers candidates)
  (find-best-candidates voter-answers candidates))

; Define the test cases
(define (test1) (best-candidates '(4 3 4 4 2 1 3 3 3 4)
                                  '((adams 3 3 3 3 3 3 3 3 3 3)
                                    (grant 1 2 1 2 1 2 1 2 1 2)
                                    (ford 4 4 4 4 4 4 4 4 4 4)
                                    (hayes 1 2 3 4 1 2 3 4 1 2)
                                    (taft 2 3 2 3 2 3 2 3 2 3)
                                    (polk 4 4 4 4 4 2 2 2 2 2))))

(define (test2) (best-candidates '(2 2 2 3 4 2 2 2 3 4)
                                  '((taylor 4 4 4 1 2 3 3 3 1 1)
                                    (wilson 1 1 1 2 3 1 1 1 2 4)
                                    (monroe 3 3 3 3 3 3 3 3 3 3))))

(define (test3) (best-candidates '(2 2 2 3 4 2 2 2 3 4)
                                  '((taylor 4 4 4 1 2 3 3 3 1 1)
                                    (monroe 3 3 3 3 3 3 3 3 3 3)
                                    (wilson 1 1 1 2 3 1 1 1 2 4))))

(define (test4) (best-candidates '(2 2 2 2 2 2 2 2 2 2)
                                  '((harding 4 4 4 4 4 4 4 4 4 4)
                                    (buchanan 3 3 3 3 3 3 3 3 3 3)
                                    (fillmore 3 4 3 4 3 4 3 4 3 4))))

; Run the test cases
(display "Test 1: ")
(test1)
(newline)
(display "Test 2: ")
(test2)
(newline)
(display "Test 3: ")
(test3)
(newline)
(display "Test 4: ")
(test4)
(newline)

