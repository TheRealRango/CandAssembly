;
; 20210521 - MC - Moodle Verzweigungen2.asm
;
; Created: 21/05/2021 12:42:02
; Author : lorenz,simon,aldo
;


; Replace with your application code
start:
	ldi R19, 0xff
	out DDRB, R19
;Sensorwert lesen:
	in r16, PINA
	;ldi R16, 0b11001111 ;"Testumgebung"
;Maskierung
	
	mov R17,R16
	andi r16,0x0f ;Sensorwert 1 maskiert
	andi r17, 0xf0 ;Sensorwert 2 maskiert

;vorderer und hinterer Teil tauschen
	swap r17

;addition
	mov r20,r16 ;Wert von r16 nach r20 verschieben damit r16 sich für den sub befehl nicht verändert (für zeile 31)
	add r20,r17 ;addieren von r20 und r17
	out PORTB,r20 ;ergebnis von r20 in PORTB ausgeben

;vergleich für Auswertung
	sub r16,r17 ;vergleich r16 r17
		
;auswertung
	breq istgleich ;wenn zeroflag gesetzt ist
	brbs 2, s1kleiner ;wenn negativflag gesetzt ist
	
	sbi PORTB,7 ;wenn keins von beiden zutrifft muss s1 groesser sein setze 7. bit 
	jmp ende

	istgleich:
	sbi PORTB,6 ;setze 6. bit
	jmp ende

	s1kleiner:
	sbi PORTB,5  ;setze 5. bit
	jmp ende

	Ende: ;ende!! :D