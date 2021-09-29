/*
 * 20210929 - MC - LaufLicht_OOP.c
 *
 * Created: 29/09/2021 11:52:42
 * Author : lorenz
 */ 

#include <avr/io.h>									//standardpaket einfügen
#include <avr/delay.h>								//delaypaket einfügen


void delay(void)
{
  _delay_ms(500);									//vordefinierte delaymethode
  
}

int main(void)
{
	DDRA = 0xFF;									//DDRA als output definieren
	PORTA = 0x00;									//PORTA auf 0 setzen
    unsigned int tab[8] = {128,64,32,16,8,4,2,1};	//Array erstellen wo die verschiedenen Dezimalstellen immer für eine 8-bit binärzahl stehen (64=0b01000000)
    unsigned int tab2[8] = {1,2,4,8,16,32,64,128};	
      
    
    while (1)										//endlosschleifen
    {
      int i = 0;									//i als zählvariable
      while (i<8)									//"Laufe solange durch, bis i nicht mehr kleiner 8 ist"
      {
        
		PORTA = tab[i];								// auf PORTA eine Stelle i des Arrays ausgeben
		delay();									//delay einfügen
		i++;										//i hochzählen
		
      }  
      for (int i =0; i<8; i++)						//FOR-Schleife bekannt aus SE i mit 0 initialisieren; schleife soll solang laufen wie i kleiner 8 ist; i hochzählen
      {		
        PORTA = tab2[i];							// auf PORTA eine Stelle i des Arrays ausgeben
        delay();									//delay einfügen
      }
      delay();										//delay einfügen
        
    }
}

