!classDefinition: #TablaAmortizacion category: #Prestamos!
OrderedCollection subclass: #TablaAmortizacion
	instanceVariableNames: 'monto plazo tasaPeriodica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos'!

!TablaAmortizacion methodsFor: 'initialization' stamp: 'ARA 4/9/2020 01:56:26'!
initializeConSaldoInicial: unMonto conCuotas: unPlazo 
	
	|amortizacion|
	
	monto := unMonto.
	plazo := unPlazo.
	
	amortizacion := Amortizacion conSaldoInicial: unMonto enCuota: unPlazo.
	self add: amortizacion.! !

!TablaAmortizacion methodsFor: 'initialization' stamp: 'ARA 4/9/2020 03:26:51'!
initializeConSaldoInicial: unMonto conCuotas: unPlazo conInteres: unaTasaPeriodica 
	
	| amortizacion |
	
	monto := unMonto.
	plazo := unPlazo.
	tasaPeriodica := unaTasaPeriodica.
	
	amortizacion := Amortizacion conSaldoInicial: unMonto enCuota: 1 conTasa: tasaPeriodica.
	
	self add: amortizacion.! !


!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:28:55'!
cuotasFaltantes
	^self size - (self at:1) numeroCuota + 1.! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:35:17'!
interesesProyectados
	^self inject: 0 into: [:sumaIntereses :cuota |  sumaIntereses + cuota interes ]! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:16:13'!
saldoActual
	self first saldo.! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:42:49'!
valorPrimeraCuota
	^(self at:1) valorCuota.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TablaAmortizacion class' category: #Prestamos!
TablaAmortizacion class
	instanceVariableNames: ''!

!TablaAmortizacion class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 01:43:42'!
conSaldoInicial: unMonto conCuotas: unPlazo 
	
	^self new initializeConSaldoInicial: unMonto conCuotas: unPlazo ! !

!TablaAmortizacion class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 03:14:08'!
conSaldoInicial: unMonto conCuotas: unPlazo conInteres: unaTasaPeriodica 
	
	^self new initializeConSaldoInicial: unMonto conCuotas: unPlazo conInteres: unaTasaPeriodica ! !


!classDefinition: #Amortizacion category: #Prestamos!
Object subclass: #Amortizacion
	instanceVariableNames: 'saldoInicial numeroCuota capital interes saldoFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos'!

!Amortizacion methodsFor: 'initialization' stamp: 'ARA 4/9/2020 03:28:47'!
initializeConSaldoInicial: unMonto enCuota: unNumeroDeCuota conTasa: unaTasaPeriodica  
	
	saldoInicial := unMonto.
	numeroCuota := unNumeroDeCuota.
	capital := unMonto.
	interes:= saldoInicial * unaTasaPeriodica.
	saldoFinal := saldoInicial - capital.! !


!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:36:02'!
interes
	
	^interes.! !

!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:26:59'!
numeroCuota
	
	^numeroCuota.! !

!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:07:39'!
saldo
	^saldoInicial.! !

!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:43:43'!
valorCuota
	^capital + interes.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Amortizacion class' category: #Prestamos!
Amortizacion class
	instanceVariableNames: ''!

!Amortizacion class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 03:25:20'!
conSaldoInicial: unMonto enCuota: unNumeroDeCuota conTasa: unaTasaPeriodica  
	
	^self new initializeConSaldoInicial: unMonto enCuota: unNumeroDeCuota conTasa: unaTasaPeriodica ! !


!classDefinition: #Prestamo category: #Prestamos!
Object subclass: #Prestamo
	instanceVariableNames: 'valorSolicitado tasa plazo amortizaciones'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos'!

!Prestamo methodsFor: 'initialization' stamp: 'ARA 4/9/2020 03:12:48'!
initializeConMonto: unMonto conTasa: unaTasa aPlazo: unPlazo 
	
	valorSolicitado := unMonto.
	tasa := unaTasa.
	plazo := unPlazo.
	
	amortizaciones := TablaAmortizacion conSaldoInicial: valorSolicitado conCuotas: plazo conInteres: tasa.
	

	
! !

!Prestamo methodsFor: 'initialization' stamp: 'ARA 4/9/2020 03:31:23'!
interesesProyectados
	^amortizaciones interesesProyectados.! !


!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:21:53'!
cuotasFaltantes
	^amortizaciones cuotasFaltantes.! !

!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:16:43'!
saldoActual
	^(amortizaciones at:1) saldo.! !

!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:41:52'!
valorProximaCuota
	^amortizaciones valorPrimeraCuota.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prestamo class' category: #Prestamos!
Prestamo class
	instanceVariableNames: ''!

!Prestamo class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 03:04:34'!
conMonto: unMonto conTasa: unaTasa aPlazo: unPlazo 
	
	^self new initializeConMonto: unMonto conTasa: unaTasa aPlazo: unPlazo ! !
