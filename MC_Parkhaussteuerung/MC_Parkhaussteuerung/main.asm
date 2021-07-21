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
	ldi r21, 0b00000000		;standardwert einladen in zählregister

start:
	;Start von der SChrankensteuerung siehe PAP Part 2.1

pruefungtaster:
	in r19, PIND			;PIND einlesen in r19
	andi r19, 0b10000000	;r19 maskieren auf den ersten Wert
	cpi r19, 0b10000000		;r19 vergleichen mit hex 128 oder ob10000000
	breq pruefungtaster		;if equal springe zu pruefungstaster
	
	ldi r20, 0b00010000		;wert laden in r20
	andi r20, 0b0010000
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
	brne pruefungschranke2	;wenn es nicht passt sprunge zu pruefungsschranke2
	
	ldi r20, 0b00000000		;wert in r20 laden
	andi r20, 0b00010000	;wert maskieren für nur bit4
	out PORTA, r20			;schranke schließen

	
	inc r21					;zählregister hochzählen
	out PORTA,r21			;auf Zählerled ausgeben
	
	;-----PAP 2.1 beendet --> weiter mit 2.2 & 2.3
pruefungvoll:
	in r19, PINA
	andi r19, 0b00001111
	cpi r19,  15
	brne pruefungvoll
	
	in r20, PINA	
	ori r20, 0b10000000
	out PORTA, r20

	;sbi PORTA, 7 --> genau das gleiche wie zeile 60-62

	in r20, PINA
	andi r20, 0b11101111
	out PORTA, r20
	
	;cbi PORTA, 5 --> genau das gleiche wie 66-68

pruefungimmernochvoll:
	in r19, PINA
	andi r19, 0b00001111
	cpi r19,  15
	breq pruefungimmernochvoll

	cbi PORTA, 7 ;Anzeige Belegt auf dunkel

	sbi PORTA, 5 ; SChranke einfahrt öffnen

jmp pruefungvoll

;---------PAP 2.2 beendet





