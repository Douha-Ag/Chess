Class {
	#name : 'MyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTest >> testOwnKing [
    | board piece king whiteKing square |

    board := MyChessBoard basicNew.
    board initialize.

    "Créer le roi blanc et le placer"
    whiteKing := MyKing white.
    square := board at: 'e1'.
    square contents: whiteKing.
    whiteKing square: square.

    "Créer un pion blanc et le placer"
    piece := MyPawn white.
    square := board at: 'a2'.
    square contents: piece.
    piece square: square.

    "Tester ownKing"
    king := piece ownKing.
    self assert: king notNil.
    self assert: king isKing.
    self assert: king color = piece color.

]
