;
; 20210615-MC-einfacheAusgabe1.asm
;
; Created: 15/06/2021 14:07:06
; Author : lorenz
;

.INCLUDE "m16def.inc"
; Replace with your application code
initialisierung:
    ldi r16, high(RAMEND);
    out SPH, r16;
    ldi r16, low(RAMEND);
    out SPL, r16;
    ;ldi R17,00;


	;PORT b als Ausgang
	ldi R16, 0xff
	ldi R25, 0x0a
	out DDRB, R16
init:
	ldi R17, 0b00000001
	
loop:
    cpi R17, 0b00000000
    breq init
    out PORTB, R17
    add R17, R17
	call delay100ms
    jmp loop

 .INCLUDE "Delay100msTimesR25.asm"