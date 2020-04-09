!classDefinition: #TablaAmortizacion category: #Prestamos!
OrderedCollection subclass: #TablaAmortizacion
	instanceVariableNames: 'monto plazo'
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


!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:28:55'!
cuotasFaltantes
	^self size - (self at:1) numeroCuota + 1.! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:16:13'!
saldoActual
	self first saldo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TablaAmortizacion class' category: #Prestamos!
TablaAmortizacion class
	instanceVariableNames: ''!

!TablaAmortizacion class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 01:43:42'!
conSaldoInicial: unMonto conCuotas: unPlazo 
	
	^self new initializeConSaldoInicial: unMonto conCuotas: unPlazo ! !


!classDefinition: #Amortizacion category: #Prestamos!
Object subclass: #Amortizacion
	instanceVariableNames: 'saldoInicial numeroCuota capital interes saldoFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos'!

!Amortizacion methodsFor: 'initialization' stamp: 'ARA 4/9/2020 02:04:24'!
initializeConSaldoInicial: unMonto enCuota: unNumeroDeCuota 
	
	saldoInicial := unMonto.
	numeroCuota := unNumeroDeCuota.
	capital := unMonto.
	interes:= 0.
	saldoFinal := saldoInicial - capital.! !


!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:26:59'!
numeroCuota
	
	^numeroCuota.! !

!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:07:39'!
saldo
	^saldoInicial.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Amortizacion class' category: #Prestamos!
Amortizacion class
	instanceVariableNames: ''!

!Amortizacion class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 01:59:02'!
conSaldoInicial: unMonto enCuota: unNumeroDeCuota 
	
	^self new initializeConSaldoInicial: unMonto enCuota: unNumeroDeCuota ! !


!classDefinition: #Prestamo category: #Prestamos!
Object subclass: #Prestamo
	instanceVariableNames: 'valorSolicitado tasa plazo amortizaciones'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos'!

!Prestamo methodsFor: 'initialization' stamp: 'ARA 4/9/2020 01:40:58'!
initializeConMonto: unMonto conTasa: unaTasa aPLazo: unPlazo 
	
	valorSolicitado := unMonto.
	tasa := unaTasa.
	plazo := unPlazo.
	
	amortizaciones := TablaAmortizacion conSaldoInicial: valorSolicitado conCuotas: plazo.
	

	
! !


!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:21:53'!
cuotasFaltantes
	^amortizaciones cuotasFaltantes.! !

!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 02:16:43'!
saldoActual
	^(amortizaciones at:1) saldo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prestamo class' category: #Prestamos!
Prestamo class
	instanceVariableNames: ''!

!Prestamo class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 00:53:28'!
conMonto: unMonto conTasa: unaTasa aPLazo: unPlazo 
	
	^self new initializeConMonto: unMonto conTasa: unaTasa aPLazo: unPlazo ! !
