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
	out DDRD, r17 ;als Eingang definieren
init:
	ldi r18, 0b00000000
	out PORTA,r18  ;alle ausgaenge auf 0 setzen für Betriebsbeginn

start:
	;Start von der SChrankensteuerung siehe PAP Part 2.1

pruefungtaster:
	in r19, PIND			;PIND einlesen in r19
	andi r19, 0b10000000	;r19 maskieren auf den ersten Wert
	cpi r19, 0b10000000		;r19 vergleichen mit hex 128 oder ob10000000
	breq pruefungtaster		;if equal springe zu pruefungstaster
	ldi r20, 0b00010000		;wert laden in r20
	out PORTA,r20			;ausgeben auf porta damit bit 4 high wird --> schranke öffnen
	
pruefungschranke:
	in r19, PIND			;PIND einlesen in r19
	andi r19, 0b01000000	;r19 maskieren auf den ersten Wert
	cpi r19, 0b01000000		;r19 vergleichen mit hex 128 oder ob10000000
	breq pruefungschranke	;if equal springe zu pruefungsschranke

pruefungschranke2:		
	in r19, PIND			
	andi r19, 0b01000000	;maskieren bit 6
	cpi r19, 0b01000000		; vergleichen mit hex 64 oder 0b01000000
	brne pruefungschranke2:	;wenn es nicht passt sprunge zu pruefungsschranke2
	
	ldi r20, 0b00000000

	


