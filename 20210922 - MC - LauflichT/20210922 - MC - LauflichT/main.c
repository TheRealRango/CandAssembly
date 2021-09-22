/*
* 20210922 - MC - LauflichT.c
*
* Created: 22/09/2021 13:45:35
* Author : lorenz
*/

#include <avr/io.h>
#include <avr/delay.h>

void delay(void)
{
	_delay_ms(500);	
	
}

void blink(void)
{
	delay();
	PORTA = 0x00;
	delay();
	PORTA = 0xff;
	delay();
}

void lauflicht(void)
{
	for (int i =0; i<8; i++)
	{
		PORTA =(1<<i);
		delay();
		PORTA = 0x00;
	}
}

int main(void)
{
	
	DDRA = 0xFF;	//set PORTB als output
	
	PORTA = 0x00;	//alle LEDS aus	
	
	/* Replace with your application code */
	while (1)
	{
		blink();
		lauflicht();
	}
}

