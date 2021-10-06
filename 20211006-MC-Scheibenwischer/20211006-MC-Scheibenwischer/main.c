/*
* 20211006-MC-Scheibenwischer.c
*
* Created: 06/10/2021 14:33:10
* Author : lorenz
*/

#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
	
	DDRA = 0xFF; //set PORTA for output
	PORTA = 0x00; //turn ON all LEDs initially
	
	unsigned char vollschritte[4] = {0b1010,0b1001,0b0101,0b0110};
	unsigned char halbschritte[8] = {0b1010,0b1000,0b1001,0b0001,0b0101,0b0100,0b0110,0b0010};
	
	int counter = 0;
	int timer = 50;
	
	
	while (1)
	{
		
		//Vollschritt
		//for (int i=0 ; i < sizeof(vollschritte); i++)
		//{
		//PORTA = vollschritte[i];
		//_delay_ms(100);
		//}
		
		
		//Halbschritt
		//while(counter <=2)
		//{
		//for (int i=0 ; i < sizeof(vollschritte); i++)
		//{
		//PORTA = vollschritte[i];
		//_delay_ms(timer);
		//}
		//
		//}
		
		
		
		
		//Schranke
		while(counter <=2)
		{
			for (int i=0 ; i < sizeof(vollschritte); i++)
			{
				PORTA = vollschritte[i];
				_delay_ms(timer);
			}
			counter++;
		}
		counter =0;
		
		while(counter <= 2)
		{
			for (int i=sizeof(vollschritte)-1 ; i >= 0; i--)
			{
				PORTA = vollschritte[i];
				_delay_ms(timer);
			}
			counter ++;
		}
		counter =0;
		
	}
}

