;
; 20210920 - MC - Unterprogramm.asm
;
; Created: 20/09/2021 9:23:31
; Author : lorenz
;

ldi r17, high(RAMEND)	;stackpointer initialisieren
out sph, r17			;HIGH-Byte der obersten RAMAdresse
ldi r18, low(RAMEND)	;low byte der obersten ramadresse
out spl, r18

push R17
push R18

; Replace with your application code
start:
    inc r16
    rjmp start
