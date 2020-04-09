!classDefinition: #PrestamoTest category: #'Prestamos-Tests'!
TestCase subclass: #PrestamoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos-Tests'!

!PrestamoTest methodsFor: 'assertions' stamp: 'ARA 4/9/2020 03:45:22'!
testPresto1000al1PorCientoMVAUnaCuota
	"comment stating purpose of message"

	|prestamo|
	
	prestamo := Prestamo conMonto: 1000 conTasaPeriodica: 0.01 aPlazo:1.
	
	self assert: prestamo cuotasFaltantes equals: 1.
	self assert: prestamo saldoActual equals: 1000.
	self assert: prestamo interesesProyectados equals: 10.
	self assert: prestamo valorProximaCuota equals: 1010.! !

!PrestamoTest methodsFor: 'assertions' stamp: 'ARA 4/9/2020 03:45:22'!
testPresto100SinInteresAUnaCuota
	"comment stating purpose of message"

	|prestamo|
	
	prestamo := Prestamo conMonto: 100 conTasaPeriodica: 0 aPlazo:1.
	
	self assert: prestamo cuotasFaltantes equals: 1.
	self assert: prestamo saldoActual equals: 100.! !
