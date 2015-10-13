;; Name: Kocsen Chung
;; Time spent on assignment: 5 hours
;; Collaborators: N/A


;; Helper function take
;; Takes the first n number of elements froma list 



;; DEFINE findInList here
(define findInList ( lst x )
    ;; if len lst == 0; return false
    (if (null? lst)
        #f
        ;; If lst[0] == x; return true
        (if (equal? (car lst) x)
            #t
            ;; else: return findInList(lst@tail, x)
            (findInList (cdr lst) x)
        )
    )
    
  
)

;; maxValueHelper (lst max)
(define maxValueHelper ( lst m )
    ;; if len lst ==0; return m
    (if (null? lst) 
        m
        (if (> (car lst) m )
            ;; elif lst[0] > m; m = lst[0]
            (maxValueHelper (cdr lst) (car lst))
            ;; else; maxValueHelper( lst@tail, m)
            (maxValueHelper (cdr lst) m)
        )
    )
)

;; Define maxValue (lst)
(define maxValue ( lst ) 
    (if (null? lst)
        0
      (maxValueHelper lst 0)
    )
)


;; minValueHelper 
(define minValueHelper ( lst m )
    ;; if len lst ==0; return m
    (if (null? lst) 
        m
        (if (< (car lst) m )
            ;; elif lst[0] > m; m = lst[0]
            (minValueHelper (cdr lst) (car lst))
            ;; else; minValueHelper( lst@tail, m)
            (minValueHelper (cdr lst) m)
        )
    )
)

;; Define minValue (lst)
(define minValue ( lst ) 
    (if (null? lst)
        0
        (minValueHelper lst 99999)
    )
) 


(define avgValueHelper (lst average count)
    (if (null? lst)
        ;; return average/count = result
        (/ average count)
        ;; avgValueHelper (list@tail)
        (avgValueHelper (cdr lst) (+ (car lst) average) (+ count 1))
    )
)

;; Define avgValue ( lst )
(define avgValue (lst)
    (if (null? lst)
        0
        (avgValueHelper lst 0 0)
    )
)


(define medValueHelper (lst pass count1 count2)
    (if (= pass 0)
        (medValueHelper lst 2 (medValueHelper lst 1 0 0) 0)
        (if (= pass 1)
            (if (null? lst)
                (if (= count1 count2) 
                    -1 
                    (sub1 count1)
                )
                (medValueHelper (cdr lst) 1 (+ count2 1) count1)
            )
            (if (= count1 -1)
                0
                (if (= count1 0)
                    (car lst)
                    (medValueHelper (cdr lst) 2 (sub1 count1) 0)
                )
            )
        )
    )
)

;; Define medValue( lst ) 
(define medValue (lst) 
    (if (null? lst)
        0
        (if (= (minValue lst) (maxValue lst))
            (car lst)
            (medValueHelper lst 0 0 0)
        )
    )
)

