;
; 20210611-MC-ParkhausEinfahrt.asm
;
; Created: 11/06/2021 13:51:07
; Author : lorenz
;


; Replace with your application code


init:
	ldi		R16, 0x00
	out		DDRA, R16

main:

	in		R17,PINA
  	andi	R17,0b00000100
	cpi		R17,4
	brbc	1,	main

	count_car:

		inc		R18
		
		loop:

		in		R17,PINA
  		andi	R17,0b00000100
		cpi		R17,4
		brbs	1,	loop
		
			rjmp main