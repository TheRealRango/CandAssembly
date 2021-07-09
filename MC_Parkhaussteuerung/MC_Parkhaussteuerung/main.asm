;
; MC_Parkhaussteuerung.asm
;
; Created: 02/07/2021 13:55:50
; Author : lorenz
;


; Replace with your application code
PullUp:
	ldi r16, 0xFF
	out DDRA, r16 ;als Ausgang definieren
	ldi r17, 0x00
	out DDRD r17 ;als Eingang definieren
init:
	ldi r18, 0b00000000
	out PORTA,r18  ;alle ausgaenge auf 0 setzen für Betriebsbeginn

start:
	;Start von der SChrankensteuerung siehe PAP Part 2.1


