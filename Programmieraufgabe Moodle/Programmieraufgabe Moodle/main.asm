;
; Programmieraufgabe Moodle.asm
;
; Created: 17/05/2021 14:14:37
; Author : lorenz
;


; Replace with your application code
initialisierung:
	ldi r16, 0xff
	out DDRB,R16

	ldi r17, 0x00
	out DDRA, R17

;Sensorwert einlesen:
	ldi r18, 0b01010011

;Maskierung
	andi r18,0x0f
	mov R19,R18

	ldi r18, 0b01010011
	andi r18, 0xf0
;vorderer und hinterer Teil tauschen
	swap r18
	mov r20,r18
;addition und Ausgabe
	ADD R20, R19
	out PORTB,R20
	

