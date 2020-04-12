!classDefinition: #UnidadesTasasTests category: #'MatematicasFinancieras-Tests'!
TestCase subclass: #UnidadesTasasTests
	instanceVariableNames: 'ea unidades'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MatematicasFinancieras-Tests'!

!UnidadesTasasTests methodsFor: 'assertions' stamp: 'ARA 4/11/2020 20:27:41'!
testBimestreVencidoConvierteAEfectivoAnual
	"comment stating purpose of message"

	| bv eaAbv bvAea |
	
	bv := unidades at: #bv.
	
	eaAbv := bv convertAmountFromBaseUnit: 0.3.
	
	bvAea:=  (bv convertToBaseUnit: 0.0446975079232772*bv).
	
	self assert: bv name = 'bv'.
	self assert: 0.0446975079232772 equals: eaAbv.
	self assert: 0.3*ea equals: (bvAea roundTo: 0.001).
	! !

!UnidadesTasasTests methodsFor: 'assertions' stamp: 'ARA 4/10/2020 15:17:16'!
testExisteEfectivoAnual
	"comment Argument name expected ->stating purpose of message"
	
	
	self assert: ea name = 'ea'
! !

!UnidadesTasasTests methodsFor: 'assertions' stamp: 'ARA 4/11/2020 20:11:25'!
testMesVencidoConvierteAEfectivoAnual
	"comment stating purpose of message"

	| mv eaAmv mvAea |
	
	mv := unidades at: #mv.
	
	eaAmv := mv convertAmountFromBaseUnit: 0.3.
	
	mvAea:=  (mv convertToBaseUnit: 0.022104450593615876*mv).
	
	self assert: mv name = 'mv'.
	self assert: 0.022104450593615876 equals: eaAmv.
	self assert: 0.3*ea equals: (mvAea roundTo: 0.001).
	! !


!UnidadesTasasTests methodsFor: 'setUp/tearDown' stamp: 'ARA 4/10/2020 15:17:29'!
setUp
	"comment stating purpose of message"
		
	unidades:= UnidadesTasas todasLasUnidades.
	ea := unidades at: #ea.
! !
