/*
* 20211020-MC-Interrupt_v1.c
*
* Created: 20/10/2021 13:56:35
* Author : lorenz
*/

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/delay.h>

ISR(INT0_vect) //definition des interrupts
{	
	int i = 0;			//code was bei Interrupt passiert
	unsigned int tab[4] = {0b0001,0b0010,0b0100,0b1000};
	while (i<4)
	{
		PORTA = tab[i];
		_delay_ms(2000);
		i++;
	}
	PORTA =0;
}
int main(void)
{
	DDRA = 0xFF;
	PORTA = 0x00;
	DDRD = 0x00; //als eingabe definieren
	PORTD = 0xFF; //Pull Up definieren
	
	MCUCR = (1<<ISC01) | (1<<ISC00); //erste Freigabe erteilen
	 
	GICR = (1<<INT0);				//zweite Freigabe erteilen
	
	sei();							//Freigabe das INterrupts 
	
	while (1)
	{
		
	}
}

