!classDefinition: #PrestamoTest category: #'Prestamos-Tests'!
TestCase subclass: #PrestamoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Prestamos-Tests'!

!PrestamoTest methodsFor: 'assertions' stamp: 'ARA 4/9/2020 01:09:18'!
testPresto100SinInteresAUnaCuota
	"comment stating purpose of message"

	|prestamo|
	
	prestamo := Prestamo conMonto: 100 conTasa: 0 aPLazo:1.
	
	self assert: prestamo cuotasFaltantes equals: 1.
	self assert: prestamo saldoActual equals: 100.! !
