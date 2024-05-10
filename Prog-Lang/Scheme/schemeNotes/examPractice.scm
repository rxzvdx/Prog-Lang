(define (f  L)
        (cond   ((null? L)                              'troll)
                ((null?  (cdr  L))                      'elf)
                ((>  (car  L)  (*  (cadr L)  2))        'hobbit)
                (else                                   (f  (cdr  L))) ))

