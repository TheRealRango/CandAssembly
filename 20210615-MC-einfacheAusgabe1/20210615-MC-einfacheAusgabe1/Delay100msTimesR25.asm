;
; Delay100msTimesR25.asm
;
; Created: 12.08.2018 11:45:08
; Author : gu
;


; Delay 100 ms x r25
delay100ms:		push r16
				in r16, SREG
				push r16
				push XL			;Register retten
				push XH
				push r25

				tst r25			;Null abfangen, Default-Wert laden
				brne delay100ms_1
				ldi r25, 0x0a	;10 *100 ms = 1 s

delay100ms_1:	ldi XL, 0x10
				ldi XH, 0x27

delay100ms_11:	nop				; 1 Takt
				nop
				nop
				nop
				nop
				nop
				sbiw XL, 1		; 2 Takte, Subtrahieren um 1
				brne delay100ms_11		; 2 Takte wenn wahr: Wenn nicht 0, dann weiter abwärtszählen, sonst 1 Takt

				dec r25
				brne delay100ms_1

				pop r25
				pop XH
				pop XL
				pop r16
				out SREG, r16
				pop r16
				ret