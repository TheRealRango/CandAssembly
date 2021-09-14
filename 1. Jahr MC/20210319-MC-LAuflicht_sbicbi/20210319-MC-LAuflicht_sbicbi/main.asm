;
; 20210319-MC-LAuflicht_sbicbi.asm
;
; Created: 19/03/2021 13:43:54
; Author : lorenz
;


;
; Lauflicht.asm
;
; Created: 16.03.2021 14:42:16
; Author : aldop
;

 


init:
ldi R16,0xff
out DDRA,R16

 


main:
sbi PORTA,0
cbi PORTA,0

sbi PORTA,1
cbi PORTA,1

sbi PORTA,2
cbi PORTA,2

sbi PORTA,3
cbi PORTA,3

sbi PORTA,4
cbi PORTA,4

sbi PORTA,5
cbi PORTA,5

sbi PORTA,6
cbi PORTA,6

sbi PORTA,7
cbi PORTA,7

rjmp main

; Replace with your application code
start:
    inc r16
    rjmp start
