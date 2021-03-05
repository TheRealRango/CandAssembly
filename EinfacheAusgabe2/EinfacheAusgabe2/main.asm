;
; EinfacheAusgabe2.asm
;
; Created: 05/03/2021 14:43:51
; Author : lorenz
;

.INCLUDE "m16def.inc"	; Assembleranweisung: Definitionsdatei für ATmega16
						; einfügen.
						; Beinhaltet Namen zur einfacheren Programmierung
						; z. B. PORTA für das Ausgangsregister des Port A
						; .DEF PORTA = 0x1b (Speicheradresse)
;==== Initialisierung====


; Replace with your application code
start:
  
;a)
ldi R20, 0x0e
mov R1, R20
;b)
ldi R17, 0b00000001
;c)
ldi R18, 4
;d)
ldi R19, 0b10000000
;e)
mov R18, R16
mov R18, R17
;f
ldi R20, 0xff
out DDRA, R20
out PORTA, R18
;g)
;ende:
; jmp ende
;h)

;i)


