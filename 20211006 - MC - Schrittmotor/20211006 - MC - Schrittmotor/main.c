/*
 * 20211006 - MC - Schrittmotor.c
 *
 * Created: 06/10/2021 11:55:23
 * Author : lorenz
 */ 

#include <avr/io.h>
#include <avr/delay.h>


int main(void)
{
    /* Replace with your application code */
	DDRA = 0xFF;
	PORTA = 0x00;
	unsigned int tab[4] = {0b1010,0b1001,0b0101,0b0110};
	
	
	
	
    while (1) 
    {
		int i = 0;
		
		while (i<4)
		{
			PORTA = tab[i];
			_delay_ms(2000);
			i++;
		}		
			
			
		
    }
}

