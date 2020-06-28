#include <hidef.h> /* for EnableInterrupts macro */
#include <string.h>
#include <stdio.h>
//#include <stdlib.h>
#include "derivative.h" /* include peripheral declarations */


unsigned int Propia = 0;  //Variable almacena temperatura MCU en °c
unsigned int Temperature_LM35 = 0;  //Variable almacena temperatura LM35 en °c
unsigned int Temperature_ADCR = 0; //Variable almacena lectura cruda de ADC
unsigned int Banderas = 0; //Bandera determina cuando hay nueva medicion disponible 1=Nueva
unsigned int Lectura = 0; //Bandera determina cual medicion se reaiza 0=MCU 1=LM35 


void delay(int);
void serial(unsigned int);
void serialchar(unsigned char[]);
void serialtext(unsigned char[],int);

//INTERRUPCION QUE SE ACTIVA AL FINALIZAR UNA LECTURA ADC
interrupt 19 void Int_ADC(){

	Temperature_ADCR = ADCR; //Almacena la medicion en Variable y limpia bandera de interrupcion.
	Banderas=1; //Activa Bandera de medicion nueva disponible.

}
void main(void) {
	SOPT1 = 0b01010011; //Turn off the wuao wuao 
	SCIC2 = 0b00001000;
	SCIBD = 30; //Serial communication
	PTADD = 0b00000111;
//	ADCSC2 = 0b00000000; // Configuracion???
	ADCCFG = 0b10011000; // Configuracion LOW POWER - LONG SAMPLE TIME - 10 BIT
	APCTL1 = 0b00001000; // Configuracion ADCP3 como pin ADC
	ADCSC1 = 0b01011010; // Solicita Medicion de la temperatura interna con interrupcion
	_asm cli;
//	if(SRS_POR == 1){
//		serial(10);
//		serialchar("Last reset: Power On Reset (POR)");
//		serial(10);
//		serial(10);
//	} else if(SRS_PIN == 1){
//		serial(10);
//		serialchar("Ultimo reset: External Reset Pin (PIN)");
//		serial(10);
//		serial(10);
//	}
	while(1){
		if(Banderas==1){
			if(Lectura==1){
				serialtext(" ADC: ",Temperature_ADCR);  //Imprime Lectura de ADC
				Temperature_LM35 = Temperature_ADCR*330/1023;  //Convierte a Grados Centrigrados
				serialtext("Temperatura LM35: ",Temperature_LM35);  //Imprime Temperatura LM35
				serial(10);  //Imprime Salto de linea
				//Cambia el color de acuerdo a la medicion de temperatura
				if(Temperature_LM35<23){
					PTAD = 0;
				} else if(Temperature_LM35<26){
					PTAD = 0b00000100;
				} else if(Temperature_LM35<29){
					PTAD = 0b00000110;
				} else if(Temperature_LM35<32){
					PTAD = 0b00000010;
				} else if(Temperature_LM35<35){
					PTAD = 0b00000011;
				} else if(Temperature_LM35<38){
					PTAD = 0b00000001;
				} else if(Temperature_LM35<41){
					PTAD = 0b00000101;
				} else {
					PTAD = 0b00000111;
				}
				Lectura=0;
				Banderas=0;
				ADCSC1 = 0b01011010; // Solicita Medicion de la temperatura interna con interrupcion
			}else{
				Propia = (25-(Temperature_ADCR*33000/1023-7012)/16460);
				serialtext("Temperatura MCU: ",Propia);
				Lectura=1;
				Banderas=0;
				ADCSC1 = 0b01000011; // Solicita Medicion de la temperatura del LM35 con interrupcion en AD3
			}
		}
	}
}


void serial(unsigned int buffer){
	while((SCIS1 & 0b10000000)==0){}
	SCID = (char) buffer;
}

void serialchar(unsigned char text[]){
	int l = strlen(text);
	int i;
	for(i=0;i<l;i++){
		while((SCIS1 & 0b10000000)==0){}
	SCID = text[i];
	}
}
void serialtext(unsigned char text[],int num){
	char chain[100];
	serialchar(text);
	sprintf(chain,"%i",num);
	serialchar(chain);
}
