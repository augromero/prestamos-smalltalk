!classDefinition: #TablaAmortizacion category: #Prestamos!
OrderedCollection subclass: #TablaAmortizacion
	instanceVariableNames: 'monto plazo tasaPeriodica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos'!

!TablaAmortizacion methodsFor: 'initialization' stamp: 'ARA 4/9/2020 12:48:51'!
initializeConSaldoInicial: unMonto conCuotas: unPlazo conInteres: unaTasaPeriodica 
		
	monto := unMonto.
	plazo := unPlazo.
	tasaPeriodica := unaTasaPeriodica.
		
	self add: (Amortizacion conSaldoInicial: monto enCuota: 1 conTasa: tasaPeriodica conCapital: (monto/plazo) rounded).
		
	(1 to: plazo -1) do: [:i | self add: ((self ultimaCuota) siguienteCuotaConTasa: tasaPeriodica)].
	
! !


!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 09:23:52'!
cuotasFaltantes
	^self size.! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:35:17'!
interesesProyectados
	^self inject: 0 into: [:sumaIntereses :cuota |  sumaIntereses + cuota interes ]! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 11:41:02'!
saldoActual
	self first saldoInicial.! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 11:39:59'!
ultimaCuota

	^ self atLast: 1! !

!TablaAmortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 14:38:08'!
valorPrimeraCuota
	^self first valorCuota.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TablaAmortizacion class' category: #Prestamos!
TablaAmortizacion class
	instanceVariableNames: ''!

!TablaAmortizacion class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 03:14:08'!
conSaldoInicial: unMonto conCuotas: unPlazo conInteres: unaTasaPeriodica 
	
	^self new initializeConSaldoInicial: unMonto conCuotas: unPlazo conInteres: unaTasaPeriodica ! !


!classDefinition: #Amortizacion category: #Prestamos!
Object subclass: #Amortizacion
	instanceVariableNames: 'saldoInicial numeroCuota capital interes saldoFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos'!

!Amortizacion methodsFor: 'initialization' stamp: 'ARA 4/9/2020 14:21:17'!
initializeConSaldoInicial: unMonto enCuota: unNumeroDeCuota conTasa: unaTasaPeriodica conCapital: unCapital   
	
	saldoInicial := unMonto.
	numeroCuota := unNumeroDeCuota.
	capital := unCapital.
	interes:= (saldoInicial * unaTasaPeriodica) rounded.
	saldoFinal := saldoInicial - capital.
	
	(saldoFinal < capital) ifTrue: [capital := capital + saldoFinal. saldoFinal := 0 ].! !

!Amortizacion methodsFor: 'initialization' stamp: 'ARA 4/9/2020 14:34:13'!
siguienteCuotaConTasa: unaTasa
	"comment stating purpose of message"

	^Amortizacion conSaldoInicial: saldoFinal  enCuota: numeroCuota  + 1 conTasa: unaTasa  conCapital: capital .! !


!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:36:02'!
interes
	
	^interes.! !

!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 11:14:08'!
saldoFinal
	
	^saldoFinal! !

!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 09:50:45'!
saldoInicial
	
	^saldoInicial! !

!Amortizacion methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:43:43'!
valorCuota
	^capital + interes.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Amortizacion class' category: #Prestamos!
Amortizacion class
	instanceVariableNames: ''!

!Amortizacion class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 11:05:35'!
conSaldoInicial: unMonto enCuota: unNumeroDeCuota conTasa: unaTasaPeriodica conCapital: unCapital 
	
	^self new initializeConSaldoInicial: unMonto enCuota: unNumeroDeCuota conTasa: unaTasaPeriodica conCapital: unCapital. ! !



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

!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 11:41:32'!
saldoActual
	^(amortizaciones at:1) saldoInicial.! !

!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 14:29:28'!
saldoFinalProyectado
	^amortizaciones ultimaCuota saldoFinal.! !

!Prestamo methodsFor: 'accessing' stamp: 'ARA 4/9/2020 03:41:52'!
valorProximaCuota
	^amortizaciones valorPrimeraCuota.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prestamo class' category: #Prestamos!
Prestamo class
	instanceVariableNames: ''!

!Prestamo class methodsFor: 'instance creation' stamp: 'ARA 4/9/2020 09:22:50'!
conMonto: unMonto conTasaPeriodica: unaTasa aPlazo: unPlazo 
	
	^self new initializeConMonto: unMonto conTasa: unaTasa aPlazo: unPlazo ! !
