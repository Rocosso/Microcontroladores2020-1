
#include <hidef.h> /* for EnableInterrupts macro */
#include "derivative.h" /* include peripheral declarations */
#include <string.h>
//#include <stdbool.h>


void serialchar(unsigned char text[]);
void serial(unsigned int buffer);
void PWM(int);
unsigned char instruction;
int registro;

void main(void) {
	//Apagar el wuao wuao
	SOPT1 = 0b01010010;
	//Comunicación Serial
	SCIC2 = 0b00001100;
	SCIBD = 30;
	//Módulo PWM
	TPMSC=0b00001000;// Fuente Reloj Bus Rate
	TPMCNT=0;// Reset the register
	TPMMOD=3999; 
	registro=400;
	TPMC1V=registro;
	TPMC0V=registro;

	  EnableInterrupts;
	for(;;) {
		while((SCIS1 & 0b00100000)==0){}
		instruction=SCID;
	
		if(instruction == 'P'){
			serialchar("Parada");
			serial(10);
			registro=0;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '1'){
			serialchar("10%");
			serial(10);
			registro=400;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '2'){
			serialchar("20%");
			serial(10);
			registro=800;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '3'){
			serialchar("30%");
			serial(10);
			registro=1200;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '4'){
			serialchar("40%");
			serial(10);
			registro=1600;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '5'){
			serialchar("50%");
			serial(10);
			registro=2000;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '6'){
			serialchar("60%");
			serial(10);
			registro=2400;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '7'){
			serialchar("70%");
			serial(10);
			registro=2800;
			TPMC1V=registro;
			TPMC0V=registro;
		
		} 
		else if(instruction == '8'){
			serialchar("80%");
			serial(10);
			registro=3200;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '9'){
			serialchar("90%");
			serial(10);
			registro=3600;
			TPMC1V=registro;
			TPMC0V=registro;
		} 
		else if(instruction == '0'){
			serialchar("100%");
			serial(10);
			registro=4000;
			TPMC1V=registro;
			TPMC0V=registro;
		}
		else if(instruction == 'O'){
			serialchar("Horario");
			serial(10);
			PWM(1);
		} 
		else if(instruction == 'I'){
			serialchar("Antihorario");
			serial(10);
			PWM(0);
		} 
	}
}

void PWM(int sentido){
	if (sentido==1){
		TPMC1SC=0b00000000;
		TPMC0SC=0b00101000;
		TPMC1V=registro;
		TPMC0V=registro;
	}
	if (sentido==0){
		TPMC0SC=0b00000000;
		TPMC1SC=0b00101000;
		TPMC1V=registro;
		TPMC0V=registro;
	}
}

void serialchar(unsigned char text[]){
	int l = strlen(text);
	int i;
	for(i=0;i<l;i++){
		while((SCIS1 & 0b10000000)==0){}
		SCID = text[i];
	}
}
void serial(unsigned int buffer){
	while((SCIS1 & 0b10000000)==0){}
	SCID = (char) buffer;
}
