;*******************************************************************
;* This stationery serves as the framework for a user application. *
;* For a more comprehensive program that demonstrates the more     *
;* advanced functionality of this processor, please see the        *
;* demonstration applications, located in the examples             *
;* subdirectory of the "Freescale CodeWarrior for HC08" program    *
;* directory.                                                      *
;*******************************************************************

; Include derivative-specific definitions
            INCLUDE 'derivative.inc'
            

; export symbols
            XDEF _Startup, main, KBI_INT
            ; we export both '_Startup' and 'main' as symbols. Either can
            ; be referenced in the linker .prm file or from C/C++ later on
            
            
            
            XREF __SEG_END_SSTACK   ; symbol defined by the linker for the end of the stack


; variable/data section
MY_ZEROPAGE: SECTION  SHORT         ; Insert here your data definition

Baud_Serial: ds.b 1
Data_TX:     ds.b 1
Long_Serial: ds.b 1
Tecla              ds.b 1                  ; Variable para la Tecla que se presiono
Retardo            ds.b 1                  ; Guarda variable para retardo antirrebote
Estado             ds.b 1                  ; Guarda el orden y avance en el proceso de calculo
Espera             ds.b 1                  ; Variable para la Espera
Numero             ds.b 1                  ; Variable para el Numero
Operando1          ds.b 1                  ; Variable para el Operando 1
Operador           ds.b 1                  ; Variable para el Operador
Operando2          ds.b 1                  ; Variable para el Operando 2
Resultado          ds.b 1                  ; Variable para el Resultado
Remainder          ds.b 2                  ; Variable para el Resultado

Verificacion       ds.b 1                  ; Variable para la Verificacion

; constant section
CONSTANTES:  SECTION   ;SECCIÓN PARA CADENAS CONSTANTES PARA IMPRIMIR
;					 ________________________ lONGITUD DE LA CADENA + 2 (ESPACIO PARA LONG+NUEVA LINEA)
;					|   
Mensaje1:     DC.B  21,"No se Puede Imprimir",10 ;78t,79t,32t,83t,69t,32t,80t,85t,69t,68t,69t,32t,73t,77t,80t,82t,73t,77t,73t,82t,10t   ;;
Mensaje2:     DC.B  13,"NO NEGATIVOS",10
Mensaje3:     DC.B  "No se Puede Imprimir",10
Mensaje4:     DC.B  41,10,"NO SE ESPERA NUMERO, SE ESPERA OPERACION",10
Mensaje5:     DC.B  41,10,"NO SE ESPERA OPERACION, SE ESPERA NUMERO",10
Mensaje6:     DC.B  45,10,"NO SE PUEDEN REALIZAR OPERACIONES SIMULTANEAS",10
Mensaje7:     DC.B  19,10,"RESULTADO NEGATIVO",10
Mensaje8:     DC.B  18,10,"DIVISION POR CERO",10



; code section
MyCode:     SECTION
main:
;------------- INICIALIZACIÓN GENERAL -----------
_Startup:
            LDHX   #__SEG_END_SSTACK ; initialize the stack pointer
            TXS
            LDA    #%01010010
            STA    SOPT1        ; Desactiva el WatchDog
            mov    #0,Data_TX
            mov    #30T,Baud_Serial
            
            mov       #0T,Tecla            ; Inicializar Variables
            mov       #0T,Espera
            mov       #0T,Numero
            mov       #0T,Operando1
            mov       #0T,Operador
            mov       #0T,Operando2
            mov       #0T,Resultado
            mov       #0T,Verificacion
            mov       #15T,Retardo
            mov       #1T,Estado
            
            jsr    Config_SER
            jsr    Config_KBI
            cli                            ; Habilitacion Global de Interrupciones
;------------- ---------------------- -----------

;------------- CICLO INFINITO -----------
mainLoop:   
            LDA    #0T
            CMP    Verificacion
            BNE    Calculadora
            BRA    mainLoop
            
;------------- ---------------------- -----------

;------------- ALGORITMO PRINCIPAL CALCULADORA ----------- 
Calculadora:
			lda    Verificacion
			mov    #0T,Verificacion
			cmp    #5T
			beq    Retroceso
			cmp    #1T
			beq    Operando
			BRA    Operacion
;------------- ------------------------------- -----------

;------------- ALGORITMO BORRAR -----------
Retroceso:
			LDA    #1T
			cmp    Estado
			beq    mainLoop
Retroceso_Aux:   
			BRCLR  6,SCIS1,Retroceso_Aux
			MOV    #60T,SCID
			ASR    Estado
			BRA    mainLoop
;------------- ---------------- -----------

;------------- ALGORITMO ALMACENAMIENTO OPERANDOS -----------
Operando:
			LDA    Estado
			cmp    #1T
			beq    Operando_1
			cmp    #4T
			beq    Operando_2
									;PONER RESPUESTA A ERROR ACA (NO SE ESPERA NUMERO, SE ESPERA OPERACION)
			MOV    #1T,Estado
			JSR    Err_Operando
			BRA    mainLoop
Operando_1:
			mov    Numero,Operando1
Operando_1_Aux:   
			BRCLR  6,SCIS1,Operando_1_Aux
            LDA    #48T
            add    Operando1
			STA    SCID
			ASL    Estado
			BRA    mainLoop
Operando_2:
			mov    Numero,Operando2
Operando_2_Aux:   
			BRCLR  6,SCIS1,Operando_2_Aux
            LDA    #48T
            add    Operando2
			STA    SCID
			ASL    Estado
			BRA    mainLoop
Err_Operando:
			lda    Mensaje4
			sta    Long_Serial
			mov    #0T,Data_TX
Err_Operando_Aux: 
            inc    Data_TX
            jsr    transmit
            LDA    Mensaje4,X
            jsr    transmit_Ret
            lda    Long_Serial
            cmp    Data_TX
            bpl    Err_Operando_Aux
			rts
;------------- ---------------------------------- -----------


;------------- ALGORITMO ALMACENAMIENTO OPERACION -----------
Operacion:
			LDA    Estado
			cmp    #2T
			BEQ    Carga_operacion
			cmp    #8T
			BEQ    Realiza_operacion
			MOV    #1T,Estado
									;PONER RESPUESTA A ERROR ACA (NO SE ESPERA OPERACION, SE ESPERA NUMERO)
			JSR    Err_Operacion
			JMP    mainLoop
Carga_operacion:
			mov    Tecla,Operador
Operacion_Aux:   
			BRCLR  6,SCIS1,Operacion_Aux
			MOV    Operador,SCID
			ASL    Estado
			JMP    mainLoop
Realiza_operacion:
			MOV    #1T,Estado
			lda    Tecla
			cmp    #61T
			beq    Busca_operacion
			MOV    #1T,Estado
									;PONER RESPUESTA A ERROR ACA (NO SEPUEDEN REALIZAR OPERACIONES SIMULTANEAS)
			JSR    Err_Simultaneo
			JMP    mainLoop
Busca_operacion:   
			BRCLR  6,SCIS1,Busca_operacion
			MOV    #61T,SCID
			LDA    Operador
			CMP    #43T
			BEQ    Opera_Suma
			CMP    #45T
			BEQ    Opera_Resta
			CMP    #42T
			BEQ    Opera_Multiplicacion
			CMP    #47T
			BEQ    Opera_Division_Aux
			JMP    mainLoop
Opera_Division_Aux:			
			JMP    Opera_Division
Opera_Suma:
			LDA    Operando1
			ADD    Operando2
			STA    Resultado
			CLRH
			LDA    Resultado
			LDX    #10T
			DIV
			STHX   Remainder
Suma_Aux:   
			BRCLR  6,SCIS1,Suma_Aux
            add    #48T
			STA    SCID
Suma_Aux1:   
			BRCLR  6,SCIS1,Suma_Aux1
			LDA    Remainder
            add    #48T
			STA    SCID
Suma_Aux2:   
			BRCLR  6,SCIS1,Suma_Aux2
			MOV    #10T,SCID
			JMP    mainLoop
Opera_Resta:
			LDA    Operando1
			SUB    Operando2
			STA    Resultado
			BMI    Resta_Negativa
Resta_Aux:    
			BRCLR  6,SCIS1,Resta_Aux
            LDA    #48T
            add    Resultado
			STA    SCID
Resta_Aux1:   
			BRCLR  6,SCIS1,Resta_Aux1
			MOV    #10T,SCID
			JMP    mainLoop
Resta_Negativa:
Resta_Aux2:   
			BRCLR  6,SCIS1,Resta_Aux2
			MOV    #45T,SCID
Resta_Aux3:   
			BRCLR  6,SCIS1,Resta_Aux3
			NEG    Resultado
            LDA    #48T
            add    Resultado
			STA    SCID
									;PONER RESPUESTA A ERROR ACA (RESULTADO NEGATIVO)
			MOV    #1T,Estado
			JSR    Err_Negativo
Resta_Aux4:   
			BRCLR  6,SCIS1,Resta_Aux4
			MOV    #10T,SCID
			JMP    mainLoop
Opera_Multiplicacion:
			LDA    Operando1
			LDX    Operando2
			MUL
			STA    Resultado
			CLRH
			LDA    Resultado
			LDX    #10T
			DIV
			STHX   Remainder
Multiplicacion_Aux:   
			BRCLR  6,SCIS1,Multiplicacion_Aux
            add    #48T
			STA    SCID
Multiplicacion_Aux1:   
			BRCLR  6,SCIS1,Multiplicacion_Aux1
			LDA    Remainder
            add    #48T
			STA    SCID
Multiplicacion_Aux2:   
			BRCLR  6,SCIS1,Multiplicacion_Aux2
			MOV    #10T,SCID
			JMP    mainLoop
Opera_Division:
			LDA    #0T
			CBEQ  Operando2,Division_cero
			CLRH
			LDA    Operando1
			LDX    Operando2
			DIV
			STA    Resultado
Division_Aux:   
			BRCLR  6,SCIS1,Division_Aux
            LDA    #48T
            add    Resultado
			STA    SCID
Division_Aux2:   
			BRCLR  6,SCIS1,Division_Aux2
			MOV    #10T,SCID
			JMP    mainLoop
Division_cero:
									;PONER RESPUESTA A ERROR ACA (DIVISION POR CERO)
			MOV    #1T,Estado
			JSR    Err_Cero
			JMP    mainLoop
Err_Operacion:
			lda    Mensaje5
			sta    Long_Serial
			mov    #0T,Data_TX
Err_Operacion_Aux: 
            inc    Data_TX
            jsr    transmit
            LDA    Mensaje5,X
            jsr    transmit_Ret
            lda    Long_Serial
            cmp    Data_TX
            bpl    Err_Operacion_Aux
			rts
Err_Simultaneo:
			lda    Mensaje6
			sta    Long_Serial
			mov    #0T,Data_TX
Err_Simultaneo_Aux: 
            inc    Data_TX
            jsr    transmit
            LDA    Mensaje6,X
            jsr    transmit_Ret
            lda    Long_Serial
            cmp    Data_TX
            bpl    Err_Simultaneo_Aux
			rts
Err_Negativo:
			lda    Mensaje7
			sta    Long_Serial
			mov    #0T,Data_TX
Err_Negativo_Aux: 
            inc    Data_TX
            jsr    transmit
            LDA    Mensaje7,X
            jsr    transmit_Ret
            lda    Long_Serial
            cmp    Data_TX
            bpl    Err_Negativo_Aux
			rts
Err_Cero:
			lda    Mensaje8
			sta    Long_Serial
			mov    #0T,Data_TX
Err_Cero_Aux: 
            inc    Data_TX
            jsr    transmit
            LDA    Mensaje8,X
            jsr    transmit_Ret
            lda    Long_Serial
            cmp    Data_TX
            bpl    Err_Cero_Aux
			rts
;------------- ---------------------------------- -----------

;;------------- IMPRIME VARIABLE NUMERO ----------- 
;Impr_Numero:
;            LDA    #48T
;            add    Numero
;Impr_Aux:   BRCLR  6,SCIS1,Impr_Aux
;            STA    SCID
;            MOV    #0T,Verificacion
;            JMP    mainLoop
;;------------- ----------------------- -----------


;;------------- IMPRIME MENSAJE 1 -----------            
;Impr_1:     lda    Mensaje1
;			sta    Long_Serial
;			mov    0,Data_TX
;Impr_1_Aux: inc    Data_TX
;            jsr    transmit
;            LDA    Mensaje1,X
;            jsr    transmit_Ret
;            lda    Long_Serial
;            cmp    Data_TX
;            bpl    Impr_1_Aux
;            rts
;;------------- ----------------- -----------


;------------- ALGORITMO PARA TRANSMITIR SERIAL ALMACENADA EN UNA CONSTANTE -----------
transmit:   
            CLRH
            LDX    Data_TX
			RTS                             ;LDA    Mensaje1,X
transmit_Ret:
            BRCLR  6,SCIS1,transmit_Ret
			STA    SCID
            RTS                             ;BRA    transmit            
;------------- ----------------------------------------------------------- -----------

;------------- ALGORITMO PARA INICIALIZAR KBI -----------
Config_KBI: ; Se Asume KBI[0-3] como entradas por defecto
            bset      4,IRQSC
            bset      2,IRQSC
            bset      1,IRQSC
            mov       #%00111100,PTBDD     ; Configuracion Puerto B _ 2 3 4 5 Salidas
            mov       #%00000000,PTADD     ; Configuracion Puerto A _ 0 1 2 3 Entradas
            lda       #%00001111
            sta       PTAPE                ; Configuracion PullUp
            mov       #%00000110,KBISC     ; Configuracion KBI
            mov       #%00001111,KBIPE     ; Configuracion Pines KBI _ 0 1 2 3
            mov       #%00000000,KBIES     ; Configuracion Rising Edge
            bset      2,KBISC         ; Apagar la bandera de la interrucpion KBI
			rts
;------------- ----------------------------- -----------


;------------- ALGORITMO PARA INICIALIZA SERIAL -----------
Config_SER: 
            mov    #%00001000,SCIC2
            clr    SCIBDH
		    mov    Baud_Serial,SCIBDL        ; Configura BaudRate 
			rts
;------------- -------------------------------- -----------


;_____________________ALGORITMO PARA LA INTERRUPCIÓN KBI____________________
KBI_INT:    
            pshh
            lda       Retardo
            jsr       Antirebote
            jsr       LeerTeclado
            bset      2,KBISC         ; Apagar la bandera de la interrucpion KBI
            bset      2,IRQSC
            clr       PTBD
            pulh
            rti
           

;_____________________RETARDO ANTIRREBOTE PARA KBI____________________ 
Antirebote:
            psha                 ;2 Cls*rt1
            lda       #109T      ;2 Cls*rt1                
rt2:        dbnza     rt2        ;4 Cls*rt1*rt2
            pula                 ;4 Cls*rt1
            dbnza     Antirebote ;4 Cls*rt1
            rts

;_____________________ALGORITMO DE BARRIDO____________________ 
LeerTeclado:
            clr       PTBD
AuxLeerTeclado:
            lda       PTAD
            and       #%00001111
            cmp       #%00001111
            beq       SalidaLeerTeclado
            mov       #1T,Verificacion
            mov       #%00111000,PTBD
            brclr     0,PTAD,Tecla1
            brclr     1,PTAD,Tecla2
            brclr     2,PTAD,Tecla3
            brclr     3,PTAD,Tecla4
            mov       #%00110100,PTBD
            brclr     0,PTAD,Tecla5
            brclr     1,PTAD,Tecla6
            brclr     2,PTAD,Tecla7
            brclr     3,PTAD,Tecla8
            mov       #%00101100,PTBD
            brclr     0,PTAD,Tecla9
            brclr     1,PTAD,Tecla10
            brclr     2,PTAD,Tecla11
            brclr     3,PTAD,Tecla12
            mov       #%00011100,PTBD
            brclr     0,PTAD,Tecla13
            brclr     1,PTAD,Tecla14
            brclr     2,PTAD,Tecla15
            brclr     3,PTAD,Tecla16
            
SalidaLeerTeclado:
			rts
Tecla1:
            mov       #1T,Numero           ; Uno
            rts
Tecla2:
            mov       #2T,Numero           ; Dos
            rts
Tecla3:
            mov       #3T,Numero           ; Tres
            rts
Tecla4:
            mov       #43T,Tecla           ; Suma
            mov       #2T,Verificacion
            rts
Tecla5:
            mov       #4T,Numero           ; Cuatro
            rts  
Tecla6:
            mov       #5T,Numero           ; Cinco
            rts
Tecla7:
            mov       #6T,Numero           ; Seis
            rts
Tecla8:
            mov       #45T,Tecla           ; Resta
            mov       #3T,Verificacion
            rts
Tecla9:
            mov       #7T,Numero           ; Siete
            rts
Tecla10:
            mov       #8T,Numero           ; Ocho
            rts
Tecla11:
            mov       #9T,Numero           ; Nueve
            rts
Tecla12:
            mov       #42T,Tecla           ; Multiplicacion
            mov       #4T,Verificacion
            rts
Tecla13:
            mov       #10T,Tecla           ; Borrar
            mov       #5T,Verificacion
            rts
Tecla14:
            mov       #0T,Numero           ; Cero
            rts
Tecla15:
            mov       #61T,Tecla           ; Igual
            mov       #6T,Verificacion
            rts
Tecla16:
            mov       #47T,Tecla           ; Division
            mov       #7T,Verificacion
            rts
