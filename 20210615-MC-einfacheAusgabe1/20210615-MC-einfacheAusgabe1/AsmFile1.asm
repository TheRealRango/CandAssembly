.INCLUDE "m16def.inc"





init:
	ldi R16, 0xff
	out DDRA, R16

main:
	
	ldi R16,0b11111111
	out PORTA,R16
	sbi PORTA, 0
	sbi PORTA, 7

ende:
	jmp ende










;
; Lauflicht.asm
;
; Created: 16.03.2021 14:28:38
; Author : Simon
;






initialisierung:
	ldi r16, high(RAMEND);
	out SPH, r16;
	ldi r16, low(RAMEND);
	out SPL, r16;
	ldi R17,00;
	ldi R25, 0x0a

; Replace with your application code

; START einfacher Ablauf
;start:
;    ldi R24, 0xff
;	out DDRA, R24
;	ldi R16, 0b00000001
;	ldi R17, 0b00000010
;	ldi R18, 0b00000100
;	ldi R19, 0b00001000
;	ldi R20, 0b00010000 
;	ldi R21, 0b00100000
;	ldi R22, 0b01000000
;	ldi R23, 0b10000000 
;
;loop:
;	out PORTA, R16
;	out PORTA, R17
;	out PORTA, R18
;	out PORTA, R19
;	out PORTA, R20
;	out PORTA, R21
;	out PORTA, R22
;	out PORTA, R23
;	
;    jmp loop

; ENDE einfacher Ablauf


; START Ablauf mit Bedingung
/*start:
    ldi R24, 0xff
	out DDRA, R24

init:
	ldi R16, 0b00000001

loop:
	cpi R16, 0b00000000
		breq init
	out PORTA, R16
	add R16, R16
	call delay100ms
    jmp loop*/


; ENDE Ablauf mit Bedingung


; START Ablauf mit sbi und cbi
/*
init:
	ldi R16,0xff
	out DDRA,R16

main:
	sbi PORTA,0
	call delay100ms
	cbi PORTA,0
	

	sbi PORTA,1
	call delay100ms
	cbi PORTA,1
	
 
	sbi PORTA,2
	call delay100ms
	cbi PORTA,2
	

	sbi PORTA,3
	call delay100ms
	cbi PORTA,3
 
	sbi PORTA,4
	call delay100ms
	cbi PORTA,4
 
	sbi PORTA,5
	call delay100ms
	cbi PORTA,5
 
	sbi PORTA,6
	call delay100ms
	cbi PORTA,6
 
	sbi PORTA,7
	call delay100ms
	cbi PORTA,7
 
rjmp main*/

; ENDE Ablauf sbi und cbi


.INCLUDE "Delay100msTimesR25.asm"
