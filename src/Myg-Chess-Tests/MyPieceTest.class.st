Class {
	#name : 'MyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTest >> testSquaresBetween [
    | board square1 square2 betweenSquares piece |

    board := MyChessBoard empty.
    piece := MyPawn new.

    "=== Cas vertical ==="
    square1 := board at: 'e1'.
    square2 := board at: 'e8'.
    betweenSquares := piece squaresBetween: square1 and: square2.
    self assert: ((betweenSquares collect: [:sq | sq name]) asArray = #('e2' 'e3' 'e4' 'e5' 'e6' 'e7')).

    "=== Cas diagonale ==="
    square1 := board at: 'a1'.
    square2 := board at: 'c3'.
    betweenSquares := piece squaresBetween: square1 and: square2.
    self assert: ((betweenSquares collect: [:sq | sq name]) asArray = #('b2')).

    "=== Cas non alignées ==="
    square1 := board at: 'a1'.
    square2 := board at: 'c4'.
    betweenSquares := piece squaresBetween: square1 and: square2.
    self assert: betweenSquares isEmpty.
]
