!classDefinition: #UnidadesTasasTests category: #'MatematicasFinancieras-Tests'!
TestCase subclass: #UnidadesTasasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MatematicasFinancieras-Tests'!

!UnidadesTasasTests methodsFor: 'assertions' stamp: 'ARA 4/9/2020 22:27:00'!
testExisteEfectivoAnual
	"comment Argument name expected ->stating purpose of message"
	|ea unidades |
	
	UnidadesTasas initializeEfectivoAnual.
	unidades:= UnidadesTasas todasLasUnidades.
	
	ea := unidades at:'ea'.
	
	self assert: ea name = 'ea'
! !
