;; Name: Kocsen Chung
;; Time spent on assignment: 3.5 hours
;; Collaborators: N/A

;; VAL declarations 
(val null-int? (@ null? int))
(val eq? (@ = int))
(val car-int (@ car int))
(val cdr-int (@ cdr int))


;; DEFINE findInList here
(define bool findInList ( ((list int) lst) (int x) )
    ;; if len lst == 0; return false
    (if (null-int? lst)
        #f
        ;; If lst[0] == x; return true
        (if (eq? (car-int lst) x)
            #t
            ;; else: return findInList(lst@tail, x)
            (findInList (cdr-int lst) x)
        )
    )
)

;; maxValueHelper (lst max)
(define int maxValueHelper ( ((list int) lst) (int m) )
    ;; if len lst ==0; return m
    (if (null-int? lst) 
        m
        (if (> (car-int lst) m )
            ;; elif lst[0] > m; m = lst[0]
            (maxValueHelper (cdr-int lst) (car-int lst))
            ;; else; maxValueHelper( lst@tail, m)
            (maxValueHelper (cdr-int lst) m)
        )
    )
)

;; Define maxValue (lst)
(define int maxValue ( ((list int) lst) ) 
    (if (null-int? lst)
        0
      (maxValueHelper lst 0)
    )
)


;; minValueHelper 
(define int minValueHelper ( ((list int) lst) (int m) )
    ;; if len lst ==0; return m
    (if (null-int? lst) 
        m
        (if (< (car-int lst) m )
            ;; elif lst[0] > m; m = lst[0]
            (minValueHelper (cdr-int lst) (car-int lst))
            ;; else; minValueHelper( lst@tail, m)
            (minValueHelper (cdr-int lst) m)
        )
    )
)

;; Define minValue (lst)
(define int minValue ( ((list int) lst) ) 
    (if (null-int? lst)
        0
        (minValueHelper lst 99999)
    )
) 


(define int avgValueHelper (((list int) lst) (int average) (int count))
    (if (null-int? lst)
        ;; return average/count = result
        (/ average count)
        ;; avgValueHelper (list@tail)
        (avgValueHelper (cdr-int lst) (+ (car-int lst) average) (+ count 1))
    )
)

;; Define avgValue ( lst )
(define int avgValue ( ((list int) lst) )
    (if (null-int? lst)
        0
        (avgValueHelper lst 0 0)
    )
)


(define int medValueHelper (((list int) lst) (int pass) (int count1) (int count2) )
    (if (eq? pass 0)
        (medValueHelper lst 2 (medValueHelper lst 1 0 0) 0)
        (if (eq? pass 1)
            (if (null-int? lst)
                (if (eq? count1 count2) 
                    -1 
                    (- count1 1)
                )
                (medValueHelper (cdr-int lst) 1 (+ count2 1) count1)
            )
            (if (eq? count1 -1)
                0
                (if (eq? count1 0)
                    (car-int lst)
                    (medValueHelper (cdr-int lst) 2 (- count1 1) 0)
                )
            )
        )
    )
)

;; Define medValue( lst ) 
(define int medValue (((list int) lst)) 
    (if (null-int? lst)
        0
        (if (eq? (minValue lst) (maxValue lst))
            (car-int lst)
            (medValueHelper lst 0 0 0)
        )
    )
)

