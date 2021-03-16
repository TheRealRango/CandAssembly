;
; AssemblerApplication2.asm
;
; Created: 16/03/2021 13:54:48
; Author : lorenz
;


ldi R17, 0x01
mov r5, r17
ldi r16, 0b0000001
or r5, r16
; Replace with your application code
start:
    inc r16
    rjmp start
