;
; 20210518-MC-Sprungbefehle.asm
;
; Created: 18/05/2021 14:22:16
; Author : lorenz
;


;ldi R16, 0x05
;ldi R17, 0x06
;sub R16, R17;

;brbs 1, Moeglichkeit2
;Moeglichkeit1:
;ldi R18, 0x01;
;jmp Ende;
	;Moeglichkeit2:
	;ldi R18, 0x02;
;Ende:

ldi R16, 0x05
ldi R17, 0x05
sub R16, R17;

brbc 1, Moeglichkeit2
Moeglichkeit1:
ldi R18, 0x01;
jmp Ende;
	Moeglichkeit2:
	ldi R18, 0x02;
Ende:
