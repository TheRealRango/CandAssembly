;
; MySecondProject.asm
;
; Created: 26/02/2021 14:57:40
; Author : lorenz
;


; Replace with your application code
ldi r16, 0b0000111

ldi r22, 0x15

ldi r20, 17
ldi r21, 8

add r25,r20
add r25,r21
mov r26,r25

start:
    inc r16 ;r16 um 1 erhöhen
	inc r17
    rjmp start ;back to start
