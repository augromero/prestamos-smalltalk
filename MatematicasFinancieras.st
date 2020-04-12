!classDefinition: #UnidadesTasas category: #MatematicasFinancieras!
Object subclass: #UnidadesTasas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MatematicasFinancieras'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnidadesTasas class' category: #MatematicasFinancieras!
UnidadesTasas class
	instanceVariableNames: 'mv ea unidades bv'!

!UnidadesTasas class methodsFor: 'instance creation' stamp: 'ARA 4/11/2020 20:22:12'!
initializeBimestreVencido
	
	^bv := NotProportionalDerivedUnit 
		baseUnit: ea
		conversionBlock: [:tasaPeriodica | ((1+ tasaPeriodica) raisedTo: (360 / 60)) - 1]
		reciprocalConversionBlock: [:efa | ((1+ efa) raisedTo: ( 60 / 360 )) - 1] 
		nameForOne:  'bv'
		nameForMany: 'bv'  
		sign: 'b.v.'! !

!UnidadesTasas class methodsFor: 'instance creation' stamp: 'ARA 4/10/2020 15:15:23'!
initializeEfectivoAnual
	
	^ea := BaseUnit nameForOne: 'ea' nameForMany: 'ea' sign: 'e.a.'. ! !

!UnidadesTasas class methodsFor: 'instance creation' stamp: 'ARA 4/11/2020 18:56:18'!
initializeMesVencido
	
	^mv := NotProportionalDerivedUnit 
		baseUnit: ea
		conversionBlock: [:tasaPeriodica | ((1+ tasaPeriodica) raisedTo: (360 / 30)) - 1]
		reciprocalConversionBlock: [:efa | ((1+ efa) raisedTo: ( 30 / 360 )) - 1] 
		nameForOne:  'mv'
		nameForMany: 'mv'  
		sign: 'm.v.'! !


!UnidadesTasas class methodsFor: 'accessing' stamp: 'ARA 4/11/2020 20:23:30'!
todasLasUnidades
	
	unidades:= Dictionary new .
	
	unidades at: #ea put: self initializeEfectivoAnual .
	unidades at: #mv put: self initializeMesVencido .
	unidades at: #bv put: self initializeBimestreVencido .
	
	^unidades.! !
