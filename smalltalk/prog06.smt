; Kocsen Chung - Program 06 in uSmall Talk 
; Time: 2h
; Collab: N/A

; A polygon class. This class will be the base class for all polygons. It should ; include the following:
; – Variables for number of sides, area, and perimeter
; – Messages for handling returning of number of sides, area, and perimeter. You will ; overwrite these for each child class.
(class Polygon Object (numSides area perimeter)
    (method numSides () 
        numSides
    )

    (method area ()
        area
    )
    
    (method perimeter ()
        perimeter
    )
)

; Rectangle
(class Rectangle Polygon (length width)
    (method initRectangle ()
        (set numSides 4)
        (set area (* length width))
        (set perimeter (+ (* length 2) (* width 2)))
    )
)

; Square
(class Square Rectangle (side)
    (method initSquare ()
        (set length side)
        (set width side)
    )
)

; Triangle, assuming base is lenA
(class Triangle Polygon (lenA, lenB, lenC, height)
    (method initTriangle ()
        (set numSides 3)
        (set area (/ (* lenA height) 2))
        (set perimeter (+ (+ lenA lenB) lenC))
    )
)

; Right Triangle
(class RightTriangle Triangle (lenA, lenB, lenC)
    (method initRightTriangle ()
        (set area 
            (if (& (> lenA lenB) (> lenA lenC))
                [   
                    (set height lenB)
                    (set area (/ (* lenB lenC) 2))
                ]
                (if (& (> lenB lenA) (> lenB lenC))
                    [
                        (set height lenC)
                        (set area (/ (* lenA lenC) 2))
                    ]
                    (if (& (> lenC lenB) (> lenC lenA))
                        [
                            (set height lenA)
                            (set area (/ (* lenA lenB) 2))
                        ]
                        [
                            (set height lenB)
                            (set area (/ (* lenB lenC) 2))
                        ]
                    )
                )
            )
        )
    )
)

; Circle
(class Circle Object (radius)
    (method perimiter ()
        ; 2 pi r
        (* 2 (* 3.1415 radius))
    )

    (method area ()
        ; pi r^2
        (* 3.1415 (* radius radius))
    )
)

