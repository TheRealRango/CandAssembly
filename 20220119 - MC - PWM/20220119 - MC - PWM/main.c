/*
 * TimerBlinklicht.c
 *
 * Created: 15.12.2021 10:02:14
 * Author : aldop, sstadtmueller, fablo
 */ 

#include <avr/io.h>
//#include <util/delay.h>
#include <math.h>
#include <avr/interrupt.h>
#include <stdbool.h>

int  startwert = 0;
bool on = true;


ISR(TIMER0_OVF_vect){ // Interrupt Service Routine
	
	
	if(on){
		
		PORTA ^=  (1<<PA0) | (1<<PA1) ;
		//PORTA =  (0<<PA0) | (0<<PA1) ; //Nur LED0 und LED1 werden geschaltet
		TCNT0 = (256-(256*0.9)) ; //aus
		on = false;
	}else {
		
		PORTA ^= (1<<PA0) | (1<<PA1);
		//PORTA =  (1<<PA0) | (1<<PA1) ; //Nur LED0 und LED1 werden geschaltet
		TCNT0 = (256-(256*0.1)) ;// an 
		on = true;
	}
	
	
	 
}

int main(void)
{
	sei();
	
	DDRA = 0xFF; ////activate PULL-UPs
	PORTA = 0xFF;	// Anfangszustand LEDs Alle an!!	
	
	TIMSK |= (1<<TOIE0);// Overflow Interrupt aktivieren
		
	//TimerCounter0 konfig als Zaehler
	TCCR0 |= ( 0 << CS02 ) | ( 0 << CS01 ) | ( 1 << CS00 ); //Vorteiler 1/64
	
	/*Startwert berechnen
	* Gewünschte Zeit z.B. 250 ms
	*Gewählter Vorteiler = 1/1024 -> 262,144ms
	* mazimal schritte = 256
	* x = (250 * 256 ) / 262,144
	* x = 244,14
	* Startwert = 255- x => 255 - 244,14 = 11	
	*
	*Berechnung 1s Timer1
	* 1/64 = 4,1934s
	*gewünschte zeit = 1s
	*maximal schritte = 65536
	* x = (1 * 65536) / 4,1934
	*x = 15628
	*Startwert = 65536 - 15628 => 49908
	*/
	startwert = 256;
	TCNT0 = startwert; //Startwert setzen für eine 1 sek
	
	while (1)
	{
			
	}
	return 1;
}


