(check-expect (findInList '(1) 2) #f)
(check-expect (findInList '(2) 2) #t)
(check-expect (findInList '(1 2) 1) #t)
(check-expect (findInList '(1 2) 2) #t)
(check-expect (findInList '(1 2) 3) #f)
(check-expect (findInList '(1 2 3 4 5 6) 5) #t)
(check-expect (findInList '(1 2 3 4 5 6) 7) #f)
(check-expect (findInList '() 5) #f)

(check-expect (maxValue '()) 0)
(check-expect (maxValue '(1)) 1)
(check-expect (maxValue '(1 2)) 2)
(check-expect (maxValue '(2 1)) 2)
(check-expect (maxValue '(1 2 3)) 3)
(check-expect (maxValue '(55 12 34)) 55)
(check-expect (maxValue '(100 101 65 76 32 86)) 101)
(check-expect (maxValue '(100 100 100)) 100)

(check-expect (minValue '()) 0)
(check-expect (minValue '(1)) 1)
(check-expect (minValue '(1 2)) 1)
(check-expect (minValue '(2 1)) 1)
(check-expect (minValue '(1 2 3)) 1)
(check-expect (minValue '(55 12 34)) 12)
(check-expect (minValue '(100 101 65 76 32 86)) 32)
(check-expect (minValue '(100 100 100)) 100)

(check-expect (avgValue '()) 0)
(check-expect (avgValue '(1)) 1)
(check-expect (avgValue '(1 2)) 1)
(check-expect (avgValue '(2 1)) 1)
(check-expect (avgValue '(1 2 3)) 2)
(check-expect (avgValue '(55 12 34)) 33)
(check-expect (avgValue '(100 101 65 76 32 86)) 76)
(check-expect (avgValue '(100 100 100)) 100)

(check-expect (medValue '()) 0)
(check-expect (medValue '(1)) 1)
(check-expect (medValue '(1 2)) 1)
(check-expect (medValue '(2 1)) 1)
(check-expect (medValue '(1 2 3)) 2)
(check-expect (medValue '(55 12 34)) 34)
(check-expect (medValue '(100 101 65 76 32 86)) 81)
(check-expect (medValue '(100 100 100)) 100)