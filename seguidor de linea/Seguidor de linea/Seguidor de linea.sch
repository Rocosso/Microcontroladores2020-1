EESchema Schematic File Version 4
LIBS:Seguidor de linea-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Diseño PCB seguidor de Linea"
Date "3 de Julio"
Rev ""
Comp "Proyecto final Microcontroladores 2020-i"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_NXP_S08:MC9S08QG8xPBE IC1
U 1 1 5EFFBD82
P 4100 3850
F 0 "IC1" H 4100 4931 50  0000 C CNN
F 1 "MC9S08QG8xPBE" H 4100 4840 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 4300 3100 50  0001 L CIN
F 3 "http://cache.nxp.com/files/microcontrollers/doc/data_sheet/MC9S08QG8.pdf" H 4200 3650 50  0001 C CNN
	1    4100 3850
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Proximity:CNY70 U1
U 1 1 5EFFD1F5
P 6900 2450
F 0 "U1" H 6900 2767 50  0000 C CNN
F 1 "CNY70" H 6900 2676 50  0000 C CNN
F 2 "OptoDevice:Vishay_CNY70" H 6900 2250 50  0001 C CNN
F 3 "https://www.vishay.com/docs/83751/cny70.pdf" H 6900 2550 50  0001 C CNN
	1    6900 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5F000711
P 8000 4300
F 0 "J5" H 8028 4276 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8028 4185 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical_SMD_Pin1Right" H 8000 4300 50  0001 C CNN
F 3 "~" H 8000 4300 50  0001 C CNN
	1    8000 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 5F002CA0
P 8000 4750
F 0 "J6" H 8028 4726 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8028 4635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical_SMD_Pin1Right" H 8000 4750 50  0001 C CNN
F 3 "~" H 8000 4750 50  0001 C CNN
	1    8000 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5F003080
P 6700 4750
F 0 "J4" H 6728 4726 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6728 4635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical_SMD_Pin1Right" H 6700 4750 50  0001 C CNN
F 3 "~" H 6700 4750 50  0001 C CNN
	1    6700 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5F0035AD
P 6650 4250
F 0 "J3" H 6678 4226 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6678 4135 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical_SMD_Pin1Right" H 6650 4250 50  0001 C CNN
F 3 "~" H 6650 4250 50  0001 C CNN
	1    6650 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F003D5A
P 6450 2550
F 0 "R1" V 6243 2550 50  0000 C CNN
F 1 "180" V 6334 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 6380 2550 50  0001 C CNN
F 3 "~" H 6450 2550 50  0001 C CNN
	1    6450 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F006136
P 7350 2350
F 0 "R3" V 7143 2350 50  0000 C CNN
F 1 "10k" V 7234 2350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 7280 2350 50  0001 C CNN
F 3 "~" H 7350 2350 50  0001 C CNN
	1    7350 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 2350 6250 2350
Wire Wire Line
	6250 2350 6250 2300
Wire Wire Line
	7200 2550 7200 2700
Wire Wire Line
	6250 2700 6250 2350
Connection ~ 6250 2350
Wire Wire Line
	7500 2350 7500 2650
Wire Wire Line
	7500 2650 6300 2650
Wire Wire Line
	6300 2650 6300 2550
Wire Wire Line
	6250 2700 7200 2700
$Comp
L power:+3.3V #PWR0101
U 1 1 5F0087D1
P 2950 2450
F 0 "#PWR0101" H 2950 2300 50  0001 C CNN
F 1 "+3.3V" H 2965 2623 50  0000 C CNN
F 2 "" H 2950 2450 50  0001 C CNN
F 3 "" H 2950 2450 50  0001 C CNN
	1    2950 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5F008E1D
P 6250 2300
F 0 "#PWR0102" H 6250 2150 50  0001 C CNN
F 1 "+5V" H 6265 2473 50  0000 C CNN
F 2 "" H 6250 2300 50  0001 C CNN
F 3 "" H 6250 2300 50  0001 C CNN
	1    6250 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0103
U 1 1 5F00993A
P 7500 2650
F 0 "#PWR0103" H 7500 2400 50  0001 C CNN
F 1 "GNDREF" H 7505 2477 50  0000 C CNN
F 2 "" H 7500 2650 50  0001 C CNN
F 3 "" H 7500 2650 50  0001 C CNN
	1    7500 2650
	1    0    0    -1  
$EndComp
Connection ~ 7500 2650
$Comp
L Sensor_Proximity:CNY70 U2
U 1 1 5F012B64
P 6950 3300
F 0 "U2" H 6950 3617 50  0000 C CNN
F 1 "CNY70" H 6950 3526 50  0000 C CNN
F 2 "OptoDevice:Vishay_CNY70" H 6950 3100 50  0001 C CNN
F 3 "https://www.vishay.com/docs/83751/cny70.pdf" H 6950 3400 50  0001 C CNN
	1    6950 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F012B6A
P 6500 3400
F 0 "R2" V 6293 3400 50  0000 C CNN
F 1 "180" V 6384 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 6430 3400 50  0001 C CNN
F 3 "~" H 6500 3400 50  0001 C CNN
	1    6500 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F012B70
P 7400 3200
F 0 "R4" V 7193 3200 50  0000 C CNN
F 1 "10k" V 7284 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 7330 3200 50  0001 C CNN
F 3 "~" H 7400 3200 50  0001 C CNN
	1    7400 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 3200 6300 3200
Wire Wire Line
	6300 3200 6300 3150
Wire Wire Line
	7250 3400 7250 3550
Wire Wire Line
	6300 3550 6300 3200
Connection ~ 6300 3200
Wire Wire Line
	7550 3200 7550 3500
Wire Wire Line
	7550 3500 6350 3500
Wire Wire Line
	6350 3500 6350 3400
Wire Wire Line
	6300 3550 7250 3550
$Comp
L power:+5V #PWR0104
U 1 1 5F012B7F
P 6300 3150
F 0 "#PWR0104" H 6300 3000 50  0001 C CNN
F 1 "+5V" H 6315 3323 50  0000 C CNN
F 2 "" H 6300 3150 50  0001 C CNN
F 3 "" H 6300 3150 50  0001 C CNN
	1    6300 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0105
U 1 1 5F012B85
P 7550 3500
F 0 "#PWR0105" H 7550 3250 50  0001 C CNN
F 1 "GNDREF" H 7555 3327 50  0000 C CNN
F 2 "" H 7550 3500 50  0001 C CNN
F 3 "" H 7550 3500 50  0001 C CNN
	1    7550 3500
	1    0    0    -1  
$EndComp
Connection ~ 7550 3500
Wire Wire Line
	7200 2350 7200 2250
Wire Wire Line
	7200 2250 7800 2250
Connection ~ 7200 2350
Wire Wire Line
	7250 3200 7250 3050
Wire Wire Line
	7250 3050 7650 3050
Connection ~ 7250 3200
Text GLabel 7650 3050 2    50   Input ~ 0
pin15-ADP1
Text GLabel 5000 3450 2    50   Input ~ 0
pin15-ADP1
Text GLabel 6450 4250 0    50   Input ~ 0
5v
Text GLabel 6500 4750 0    50   Input ~ 0
5v
Text GLabel 6300 3200 0    50   Input ~ 0
5v
Text GLabel 6250 2350 0    50   Input ~ 0
5v
Text GLabel 7800 4300 0    50   Input ~ 0
3.3v
Text GLabel 7800 4750 0    50   Input ~ 0
3.3v
Text GLabel 2750 2450 0    50   Input ~ 0
3.3v
$Comp
L power:GNDREF #PWR0106
U 1 1 5F017BAD
P 6450 4350
F 0 "#PWR0106" H 6450 4100 50  0001 C CNN
F 1 "GNDREF" H 6455 4177 50  0000 C CNN
F 2 "" H 6450 4350 50  0001 C CNN
F 3 "" H 6450 4350 50  0001 C CNN
	1    6450 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0107
U 1 1 5F018B34
P 6500 4850
F 0 "#PWR0107" H 6500 4600 50  0001 C CNN
F 1 "GNDREF" H 6505 4677 50  0000 C CNN
F 2 "" H 6500 4850 50  0001 C CNN
F 3 "" H 6500 4850 50  0001 C CNN
	1    6500 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0108
U 1 1 5F0191D6
P 7800 4850
F 0 "#PWR0108" H 7800 4600 50  0001 C CNN
F 1 "GNDREF" H 7805 4677 50  0000 C CNN
F 2 "" H 7800 4850 50  0001 C CNN
F 3 "" H 7800 4850 50  0001 C CNN
	1    7800 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0109
U 1 1 5F01965E
P 7800 4400
F 0 "#PWR0109" H 7800 4150 50  0001 C CNN
F 1 "GNDREF" H 7805 4227 50  0000 C CNN
F 2 "" H 7800 4400 50  0001 C CNN
F 3 "" H 7800 4400 50  0001 C CNN
	1    7800 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0110
U 1 1 5F019AA5
P 4100 4750
F 0 "#PWR0110" H 4100 4500 50  0001 C CNN
F 1 "GNDREF" H 4105 4577 50  0000 C CNN
F 2 "" H 4100 4750 50  0001 C CNN
F 3 "" H 4100 4750 50  0001 C CNN
	1    4100 4750
	1    0    0    -1  
$EndComp
Text GLabel 4100 2950 0    50   Input ~ 0
3.3v
Text GLabel 5000 3950 2    50   Input ~ 0
TX-TransmisionSerial
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5F01A398
P 6350 5550
F 0 "J2" H 6378 5526 50  0000 L CNN
F 1 "Reprogramacion del micro" H 6378 5435 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 6350 5550 50  0001 C CNN
F 3 "~" H 6350 5550 50  0001 C CNN
	1    6350 5550
	1    0    0    -1  
$EndComp
Text GLabel 6150 5550 0    50   Input ~ 0
BKGDM
Text GLabel 3200 3650 0    50   Input ~ 0
BKGDM
Text GLabel 6150 5650 0    50   Input ~ 0
Reset
Text GLabel 3200 3550 0    50   Input ~ 0
Reset
Text GLabel 5000 4350 2    50   Input ~ 0
TMPCH1-PWM_Derecha
Text GLabel 4600 5300 2    50   Input ~ 0
TMPCH1-PWM_Derecha
Text GLabel 5000 3350 2    50   Input ~ 0
TMPCH2_PWM_Izquierda
Text GLabel 4600 5200 2    50   Input ~ 0
TMPCH2_PWM_Izquierda
Text GLabel 5000 3550 2    50   Input ~ 0
pin14-ADP2
Text GLabel 7800 2250 2    50   Input ~ 0
pin14-ADP2
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5F0254CF
P 4400 5300
F 0 "J1" H 4292 4975 50  0000 C CNN
F 1 "PWM MOTORES DC" H 4292 5066 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 4400 5300 50  0001 C CNN
F 3 "~" H 4400 5300 50  0001 C CNN
	1    4400 5300
	-1   0    0    1   
$EndComp
NoConn ~ 5000 3650
NoConn ~ 5000 3850
NoConn ~ 5000 4050
NoConn ~ 5000 4150
NoConn ~ 5000 4250
NoConn ~ 3200 4350
NoConn ~ 3200 4250
$Comp
L Device:C C2
U 1 1 5F027540
P 3100 2600
F 0 "C2" H 3215 2646 50  0000 L CNN
F 1 "0.1uF" H 3215 2555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 3138 2450 50  0001 C CNN
F 3 "~" H 3100 2600 50  0001 C CNN
	1    3100 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5F027DCA
P 2750 2600
F 0 "C1" H 2868 2646 50  0000 L CNN
F 1 "10uF" H 2868 2555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 2788 2450 50  0001 C CNN
F 3 "~" H 2750 2600 50  0001 C CNN
	1    2750 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2450 2950 2450
Wire Wire Line
	2750 2750 2900 2750
Connection ~ 2950 2450
Wire Wire Line
	2950 2450 3100 2450
$Comp
L power:GNDREF #PWR0111
U 1 1 5F029637
P 2900 2750
F 0 "#PWR0111" H 2900 2500 50  0001 C CNN
F 1 "GNDREF" H 2905 2577 50  0000 C CNN
F 2 "" H 2900 2750 50  0001 C CNN
F 3 "" H 2900 2750 50  0001 C CNN
	1    2900 2750
	1    0    0    -1  
$EndComp
Connection ~ 2900 2750
Wire Wire Line
	2900 2750 3100 2750
Text GLabel 4100 4750 0    50   Input ~ 0
GND
$EndSCHEMATC
