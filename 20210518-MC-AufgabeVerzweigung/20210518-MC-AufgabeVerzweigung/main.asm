;
; 20210518-MC-AufgabeVerzweigung.asm
;
; Created: 18/05/2021 14:37:25
; Author : lorenz
;


; Replace with your application code
initialisierung:
	ldi r16, 0xff
	out DDRB,R16

	ldi r17, 0x00
	out DDRA, R17
	out SFIOR,R17

;Sensorwert setzen:
	ldi r18, 0b01010101

;Maskierung
	andi r18,0x0f
	mov R19,R18

	ldi r18, 0b01010101
	andi r18, 0xf0
;vorderer und hinterer Teil tauschen
	swap r18
	mov r20,r18
;addition und Ausgabe
	sub R20, R19
	
	brbs 1,LEDein
	LEDaus:;
		ldi R18, 0x00;
		out PORTB, R18;
	jmp Ende
	LEDein:
		ldi R18, 0x01;
		out PORTB, R18;
	Ende:
	


