/*
* 20211006-MC-Schrank.c
*
* Created: 06/10/2021 12:48:45
* Author : lorenz
*/

#include <avr/io.h>
#include <avr/delay.h>


int main(void)
{
	/* Replace with your application code */
	DDRA = 0xFF;
	PORTA = 0x00;
	//PORTA = 0b00001010;
	unsigned int tab[4] = {0b1010,0b1001,0b0101,0b0110};
	/*PORTA = tab[0];
	_delay_ms(1000);
	PORTA = tab[1];
	_delay_ms(1000);
	PORTA = tab[2];
	_delay_ms(1000);
	PORTA = tab[3];
	_delay_ms(1000);
	
	PORTA = tab[2];
	_delay_ms(1000);
	PORTA = tab[1];
	_delay_ms(1000);
	PORTA = tab[0];
	_delay_ms(1000);*/
	
	for (int i=0;i<sizeof(tab);i++)
	{
		PORTA = tab[i];
		_delay_ms(1000);
	}
	
	
	for (int i=3;i>sizeof(tab);i--)
	{
		PORTA = tab[i];
		_delay_ms(1000);
	}



	/*while (1)
	{
	int i = 0;
	PORTA = 0b1010;
	while (i<4)
	{
	PORTA = tab[i];
	_delay_ms(2000);
	i++;
	}
	}*/
}

