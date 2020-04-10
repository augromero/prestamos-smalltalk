!classDefinition: #UnidadesTasas category: #MatematicasFinancieras!
NotProportionalDerivedUnit subclass: #UnidadesTasas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MatematicasFinancieras'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnidadesTasas class' category: #MatematicasFinancieras!
UnidadesTasas class
	instanceVariableNames: 'ea'!

!UnidadesTasas class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 19:29:40'!
initializeEfectivoAnual
	
	ea := BaseUnit nameForOne: 'ea' nameForMany: 'ea' sign: 'e.a.'. ! !


!UnidadesTasas class methodsFor: 'accessing' stamp: 'ARA 4/9/2020 22:26:34'!
todasLasUnidades

	| unidades |
	
	unidades:= Dictionary new .
	
	unidades at:'ea' put: ea.
	
	^unidades.! !
