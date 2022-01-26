/*
* TimerBlinklicht.c
*
* Created: 15.12.2021 10:02:14
* Author : aldop, sstadtmueller, fablo
*/



#include <avr/io.h>

#include <avr/interrupt.h>

int i;
ISR(TIMER0_OVF_vect){ // Interrupt Service Routine
	
	if(i == 3){ //If abzweigung, dass es nur jedes 4. mal also 4x 250 ms =>1s
		PORTA = ~PORTA; //komplett porta wird invertiert mit ~
		//PORTA ^= (1<<PA1); //licht wird an zweiter stelle (0 = erste stelle ,1 = zweite stelle) getoggelt bei jedem ISR-durchlauf

		TCNT0 = 11;  //Startwert erneut setzen
		int i = 0 ;
	}
	else {
		i++;
	}

}

int main(void)
{
	sei();
	
	DDRA = 0xFF; ////activate PULL-UPs //auf Ausgang setzen
	PORTA = 0x00;

	TIMSK |= (1<<TOIE0);// Overflow Interrupt aktivieren

	//TimerCounter0 konfig als Zaehler
	TCCR0 |= ( 0 << CS02 ) | ( 1 << CS01 ) | ( 1 << CS00 ); //Vorteiler 1/16
	
	TCCR0 |= 0b011;

	//startwert berechnen --> ich will 250 ms bei prescaler 1024 (TCCR0 |= 0b101) --> Timer0
	// prescaler mit 1/1024 hat wert von 262.144ms --> höchste von timer0
	//262.144 ms --> 256 schritte
	//ich will 250 ms
	//also 256 / 262.144 = 0.976
	//0.976*250 = 244.14
	//255 - 244.14 = 11 --> Startwert!
	
	TCNT0 = 11; //Startwert
	
	sei();

	while (1)
	{

	}

}