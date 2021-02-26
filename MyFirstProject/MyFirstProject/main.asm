;
; MyFirstProject.asm
;
; Created: 26/02/2021 13:39:35
; Author : lorenz
;

ldi r16, 0b00000111

; Replace with your application code
start:
    inc r16
    rjmp start
