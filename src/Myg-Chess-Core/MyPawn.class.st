Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyPawn >> diagonalCaptureSquares [
    "Retourne les cases de capture diagonale du pion selon sa position actuelle"
    | board currentSquare captures col fileNumber |
    
    board := self board.
    currentSquare := self square.
    captures := OrderedCollection new.
    
    col := currentSquare column.
    fileNumber := currentSquare file asString asInteger.  
    
    self isWhite 
        ifTrue: [
            "Capture en haut à gauche"
            (board at: ((col asciiValue - 1) asCharacter asString , (fileNumber + 1) asString) ifAbsent: nil) ifNotNil: [ :sq | captures add: sq ].
            "Capture en haut à droite" 
            (board at: ((col asciiValue + 1) asCharacter asString , (fileNumber + 1) asString) ifAbsent: nil) ifNotNil: [ :sq | captures add: sq ].
        ]
        ifFalse: [
            "Capture en bas à gauche"
            (board at: ((col asciiValue - 1) asCharacter asString , (fileNumber - 1) asString) ifAbsent: nil) ifNotNil: [ :sq | captures add: sq ].
            "Capture en bas à droite"
            (board at: ((col asciiValue + 1) asCharacter asString , (fileNumber - 1) asString) ifAbsent: nil) ifNotNil: [ :sq | captures add: sq ].
        ].
    
    ^ captures
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
]
