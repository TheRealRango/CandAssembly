;
; 20210316-MC-Lauflicht.asm
;
; Created: 16/03/2021 14:44:26
; Author : lorenz
;

start:
    ldi R24, 0xff
    out DDRA, R24
    ldi R16, 0b00000001
    ldi R17, 0b00000010
    ldi R18, 0b00000100
    ldi R19, 0b00001000
    ldi R20, 0b00010000 
    ldi R21, 0b00100000
    ldi R22, 0b01000000
    ldi R23, 0b10000000 
loop:
    out PORTA, R16
    out PORTA, R17
    out PORTA, R18
    out PORTA, R19
    out PORTA, R20
    out PORTA, R21
    out PORTA, R22
    out PORTA, R23
    
    jmp loop

	
    
    
    
      start:
    ldi R24, 0xff
    out DDRA, R24
init:
    ldi R16, 0b00000001
    
loop:
    cpi R16, 0b00000000
    breq init
    out PORTA, R16
    add R16, R16
    
    jmp loop