;
; 20210312_EinfacheAusgabe3.asm
;
; Created: 12/03/2021 14:59:52
; Author : lorenz
;

ldi R16, 17
ldi R17, 8

add R16, R17

mov R25,16

ldi R20, oxFF
out DDRA, R20
out PORTA, R25

ldi R26, 0x14
mov R1, R26

; Replace with your application code
start:
    inc r16
    rjmp start
