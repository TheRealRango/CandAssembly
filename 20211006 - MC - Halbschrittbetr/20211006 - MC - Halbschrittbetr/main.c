/*
* 20211006 - MC - Halbschrittbetr.c
*
* Created: 06/10/2021 12:29:13
* Author : lorenz
*/


#include <avr/io.h>
#include <avr/delay.h>


int main(void)
{
	/* Replace with your application code */
	DDRA = 0xFF;
	PORTA = 0x00;
	unsigned int tab[8] = {0b1010,0b1000,0b1001,0b0001,0b0101,0b0100,0b0110,0b0010};
	
	
	
	while (1)
	{
		int i = 0;
		
		while (i<8)
		{
			PORTA = tab[i];
			_delay_ms(5000);
			i++;
		}
		
		
		
	}
}

