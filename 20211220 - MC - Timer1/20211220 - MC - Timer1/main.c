/*
* TimerBlinklicht.c
*
* Created: 15.12.2021 10:02:14
* Author : aldop, sstadtmueller, fablo
*/



#include <avr/io.h>
//#include <util/delay.h>
//#include <math.h>
#include <avr/interrupt.h>


ISR(TIMER1_OVF_vect){ // Interrupt Service Routine
	

	PORTA = ~PORTA; //komplett porta wird invertiert mit ~
	//PORTA ^= (1<<PA1); //licht wird an zweiter stelle (0 = erste stelle ,1 = zweite stelle) getoggelt bei jedem ISR-durchlauf

	TCNT1 = 49908;  //Startwert erneut setzen
	

}



int main(void)
{
	sei();
	
	DDRA = 0xFF; ////activate PULL-UPs //auf Ausgang setzen
	PORTA = 0x00;

	TIMSK |= (1<<TOIE1);// Overflow Interrupt aktivieren

	
	TCCR1B |=  ( 0 << CS12 ) | ( 1 << CS11 ) | ( 1 << CS10 ); //Vorteiler 1/64
		
	//Berechnung Timer 1 1s
	//4.1934 --> 1/64 prescaler
	//gewünschte Zeit 1s
	//max Schritte 65536
	//x = ( 1s* 65536)/4.1934
	//X = 15628
	//Startwert= 65536-15628 = 49908
	
	TCNT1 = 49908;
	
	sei();

	while (1)
	{

	}

}