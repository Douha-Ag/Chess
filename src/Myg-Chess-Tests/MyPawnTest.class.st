Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testPawnDiagonalCaptureSquares [
    | board pawn captures |

    board := MyChessBoard empty.
    pawn := MyPawn white.
    board at: 'e2' put: pawn.

    captures := pawn diagonalCaptureSquares.
    
    "Doit trouver d3 et f3"
    self assert: captures size equals: 2.
    self assert: (captures anySatisfy: [:sq | sq name = 'd3']).
    self assert: (captures anySatisfy: [:sq | sq name = 'f3']).
]
