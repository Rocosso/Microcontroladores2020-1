#include <hidef.h>       /* for EnableInterrupts macro */
#include "derivative.h"  /* include peripheral declarations */
#include <stdio.h>       //uso de operaciones en C
#include <string.h>      //uso de mensajes largos por uso de strings de C
 
//VECTOR 16 RecibirDato //futuros cambios de archivo y tipo de proyecto 
void SCI_send(char);
unsigned char RecibirDato(void);
unsigned char calculadora(void);



unsigned char *msg1="e';  //rror, se esperaba un valor entre 0 y 9";
unsigned char *msg2="error, se esperaba operando + - * / ^ !";
unsigned char *msg3="error, divición por 0";
unsigned char *msg4="error, se esperaba operador ="; //mensajes de error en caso de equivocacion al teclear
unsigned char *msg5="error, aun no es momento de usar =";  /**/
unsigned char *msg6="el resultado es:";
unsigned char valor1,valor2,valor,dato,operando;
unsigned char resultado,b;
unsigned int verif,a;         // variable que cuenta en que paso esta el calculo
unsigned int i=0;
unsigned char *c=" ",*d=" ";

void SCI_init(){
	SCIBDH = 0;
	SCIBDL = 26;  //baud rate de 9600
	SCIC1 = 0x00; //CONFIGURA EL PRIMER REGISTRO
	SCIC2_TE = 1; //HABILITA TRANSMISION
	SCIC2_RE = 1; //HABILITA RECEPCION
	SCIC2_RIE = 1; //HABILITA INTERRUPCION DEL RECEPTOR
}

void SCI_send(char dato){
	while(SCIS1_TDRE == 0);
	  //si no hay dato en el registro puede enviar
	SCID = dato+48; //para convertirlo a ASCII y enviarlo
  return;
}

unsigned char RecibirDato(void){
 while(SCIS1_RDRF==0);{
  valor=SCID-48; 
  return SCID-48; 
 }
}


//#define *********************************************************************************************
void LecturaSCI(){

    // valor= RecibirDato();

  if (0<valor<9){ 
	  if(verif==1){
	    valor1=valor;
	    verif=verif+1; 
	  }
	  if(verif==2){
	  //a=printf(msg1); 
	  }
	  if (verif==3){
	    valor2=valor; 
	    verif=verif+1;
	  }
	   if(verif==4){
	   //a=printf(msg4); 
	  }
  } 
  else {
    if(valor=='+' ||valor=='-'||valor== '*'||valor== '/'||valor== '^'||valor== '!' ) {
      
       if(verif==2){
        operando=valor;
        verif=verif+1;
        if(valor== '!' ){
           verif=verif+1;
        }
       }else {
        //a=printf(msg2);
       }
    }
     
    else{
      if(valor=='='){
       if(verif==4){
        
       resultado=calculadora();
       //a=printf(msg6,resultado);
        //a= SCI_send(resultado);
       }
       else{
       //a=printf(msg5); 
      }
      }
      if(valor == 'd'){ //en caso de borrar usar la letra d
         for(i;i<1000;i++){
			    //a=printf(" ");
	      	}
		     if(verif==1){
				  valor1=' ';
			    }
			    else{
				    if(verif==2){
					    operando=' ';
				    }
				    else{
					    if(verif==3){
						    valor2=' ';
					    }
				    }
			    } 
			    
	  	//a=printf(c,valor1);  //
      //a=printf(d,operando); 
      //a=printf(c,valor2); 
      }
      else{
      //a=printf("error el valor insertado no es reconocido");
      }
    }
  }
}


unsigned char calculadora(){
	switch(operando){
	case'+':
		dato=valor1+valor2;
	case'-':
		dato=valor1-valor2;
	case'*':
		dato=valor1*valor2;
	case'/':
		if(valor2==0){
			//a=printf(msg3);   //error div/0
		}else{
		 	dato=valor1/valor2;
		}
	case'^':
	  for(i=0;i<valor2;i++){
	   valor1=valor1*valor1; 
	  }
	  dato=valor1;
	case'!':
	  for(i=0;i<valor1;i++){
	   valor1=valor1*(valor1-1);
	   }
	   dato=valor1;  
	}
	valor1=0;
	operando=0;
	valor2=0;   //limpia variables para reiniciar el calculo	
	return dato;
}

void main(void) {

	SOPT1 = 0b01010010;  //apaga perro guardian
	PTBDD = 0b00001111;	 //inicializacion del puerto B
	PTBPE = 0x80;				 //enable resistencias pull	
	
	PTBDD_PTBDD0 = 1;
	PTBD_PTBD0 = 1;
	
	SCI_init();
	
  EnableInterrupts;  

  for(;;) {
	     LecturaSCI();
	  
  } /* loop forever */
  /* please make sure that you never leave main */
}
