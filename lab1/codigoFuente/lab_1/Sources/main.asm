;*******************************************************************
;* This stationery serves as the framework for a user application. *
;*LED ROJO-PTA0*
;*LED VERDE-PTA1*
;*LED AZUL-PTA2*
;*fOSC= 4SEGUNDOS*
;*RGB POSITIVO COMUN   
;negative logyc                                                  
;*******************************************************************

; Include derivative-specific definitions
            INCLUDE 'derivative.inc'
          

; export symbols
            XDEF _Startup, main
            ; we export both '_Startup' and 'main' as symbols. Either can
            ; be referenced in the linker .prm file or from C/C++ later on
            
            
            
            XREF __SEG_END_SSTACK   ; symbol defined by the linker for the end of the stack


; variable/data section
MY_ZEROPAGE: SECTION  SHORT         ; Insert here your data definition

    
; code section
MyCode:     SECTION
main:
      lda #%10000000       
      sta ICSC1        ;configura referencia externa del reloj
      lda #%00000100
      sta ICSC2        ;configura oscilador externo sin preescalador
_Startup:
     	sta SOPT1
			bset 0,PTADD
			bset 1,PTADD
			bset 2,PTADD ;pone e estado ALTO el bit 0 DEL ARREGLO
			bset 0,PTAD 
			bset 1,PTAD
			bset 2,PTAD;pone en estado bajo el bit del arreglo

mainLoop:
            ; Insert your code here
                    ;MAGENTA
			bclr 0,PTAD
			bclr 2,PTAD
			;AZUL
			bset 0,PTAD
			;CIAN
			bclr 1,PTAD
			;verde
			bset 2,PTAD
			;AMARILLO
			bclr 0,PTAD
			;ROJO
			bset 1,PTAD
			;BLANCO
			bclr 1,PTAD
			bclr 2,PTAD
			;NEGRO
			bset 0,PTAD
			bset 1,PTAD
			bset 2,PTAD
            BRA    mainLoop
