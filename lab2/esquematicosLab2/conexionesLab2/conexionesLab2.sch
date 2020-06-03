EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Crystal Y?
U 1 1 5ED6C731
P 3950 3700
F 0 "Y?" V 3950 3968 50  0000 C CNN
F 1 "4MHz" V 3950 3500 50  0000 C CNN
F 2 "" H 3950 3700 50  0001 C CNN
F 3 "~" H 3950 3700 50  0001 C CNN
	1    3950 3700
	0    1    1    0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5ED6D3BC
P 3700 3350
F 0 "C?" V 3550 3150 50  0000 L CNN
F 1 "30pF" V 3878 3305 50  0000 L CNN
F 2 "" H 3700 3350 50  0001 C CNN
F 3 "~" H 3700 3350 50  0001 C CNN
	1    3700 3350
	0    1    1    0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5ED6DA03
P 3750 2300
F 0 "C?" H 3928 2346 50  0000 L CNN
F 1 "0.1uF" H 3928 2255 50  0000 L CNN
F 2 "" H 3750 2300 50  0001 C CNN
F 3 "~" H 3750 2300 50  0001 C CNN
	1    3750 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5ED6E089
P 7800 3450
F 0 "R?" V 8007 3450 50  0000 C CNN
F 1 "330 Ohm" V 7850 3150 50  0000 C CNN
F 2 "" V 7730 3450 50  0001 C CNN
F 3 "~" H 7800 3450 50  0001 C CNN
	1    7800 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED6E68A
P 7750 3300
F 0 "R?" V 7957 3300 50  0000 C CNN
F 1 "330 Ohm" V 7800 3000 50  0000 C CNN
F 2 "" V 7680 3300 50  0001 C CNN
F 3 "~" H 7750 3300 50  0001 C CNN
	1    7750 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED6F601
P 7750 3150
F 0 "R?" V 7957 3150 50  0000 C CNN
F 1 "330 Ohm" V 7800 2850 50  0000 C CNN
F 2 "" V 7680 3150 50  0001 C CNN
F 3 "~" H 7750 3150 50  0001 C CNN
	1    7750 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED6F607
P 7750 3000
F 0 "R?" V 7957 3000 50  0000 C CNN
F 1 "330 Ohm" V 7800 2700 50  0000 C CNN
F 2 "" V 7680 3000 50  0001 C CNN
F 3 "~" H 7750 3000 50  0001 C CNN
	1    7750 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED70323
P 7750 2850
F 0 "R?" V 7957 2850 50  0000 C CNN
F 1 "330 Ohm" V 7800 2550 50  0000 C CNN
F 2 "" V 7680 2850 50  0001 C CNN
F 3 "~" H 7750 2850 50  0001 C CNN
	1    7750 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED70329
P 7750 2700
F 0 "R?" V 7957 2700 50  0000 C CNN
F 1 "330 Ohm" V 7800 2400 50  0000 C CNN
F 2 "" V 7680 2700 50  0001 C CNN
F 3 "~" H 7750 2700 50  0001 C CNN
	1    7750 2700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED7032F
P 7750 2550
F 0 "R?" V 7957 2550 50  0000 C CNN
F 1 "330 Ohm" V 7800 2250 50  0000 C CNN
F 2 "" V 7680 2550 50  0001 C CNN
F 3 "~" H 7750 2550 50  0001 C CNN
	1    7750 2550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED70335
P 7750 2400
F 0 "R?" V 7957 2400 50  0000 C CNN
F 1 "330 Ohm" V 7800 2150 50  0000 C CNN
F 2 "" V 7680 2400 50  0001 C CNN
F 3 "~" H 7750 2400 50  0001 C CNN
	1    7750 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP1 C?
U 1 1 5ED721C7
P 3200 2200
F 0 "C?" H 3315 2246 50  0000 L CNN
F 1 "10uF" H 3315 2155 50  0000 L CNN
F 2 "" H 3200 2200 50  0001 C CNN
F 3 "~" H 3200 2200 50  0001 C CNN
	1    3200 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2050 4900 2050
Connection ~ 3750 2050
Wire Wire Line
	3750 2050 3200 2050
$Comp
L pspice:C C?
U 1 1 5ED7470D
P 3700 4100
F 0 "C?" V 3600 3800 50  0000 L CNN
F 1 "30pF" V 3878 4055 50  0000 L CNN
F 2 "" H 3700 4100 50  0001 C CNN
F 3 "~" H 3700 4100 50  0001 C CNN
	1    3700 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 3350 3450 3350
Wire Wire Line
	3450 3350 3450 3700
Wire Wire Line
	3100 3700 3100 4300
Wire Wire Line
	3150 4300 3100 4300
Wire Wire Line
	3100 3700 3450 3700
Connection ~ 3450 3700
Wire Wire Line
	3450 3700 3450 4100
Wire Wire Line
	3950 3850 3950 4100
Wire Wire Line
	3950 3550 3950 3350
Wire Wire Line
	3950 3350 4500 3350
$Comp
L Display_Character:LTS-6960HR AFF?
U 1 1 5ED781A2
P 9200 3050
F 0 "AFF?" H 9200 3717 50  0000 C CNN
F 1 "LTS-6960HR" H 9200 3626 50  0000 C CNN
F 2 "Display_7Segment:7SegmentLED_LTS6760_LTS6780" H 9200 2450 50  0001 C CNN
F 3 "https://datasheet.octopart.com/LTS-6960HR-Lite-On-datasheet-11803242.pdf" H 9200 3050 50  0001 C CNN
	1    9200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2400 8700 2400
Wire Wire Line
	8700 2400 8700 2650
Wire Wire Line
	8650 2550 8650 2750
Wire Wire Line
	8650 2750 8700 2750
Wire Wire Line
	7900 2700 8600 2700
Wire Wire Line
	8600 2700 8600 2850
Wire Wire Line
	8600 2850 8700 2850
Wire Wire Line
	8500 2850 8500 2950
Wire Wire Line
	8500 2950 8700 2950
Wire Wire Line
	7900 2850 8500 2850
Wire Wire Line
	7900 2550 8650 2550
Wire Wire Line
	7900 3000 8700 3000
Wire Wire Line
	8700 3000 8700 3050
Wire Wire Line
	7900 3150 8700 3150
Wire Wire Line
	7900 3300 8700 3300
Wire Wire Line
	8700 3300 8700 3250
Wire Wire Line
	7950 3450 8700 3450
Wire Wire Line
	8700 3450 8700 3650
Wire Wire Line
	8700 3650 9700 3650
Wire Wire Line
	9700 3650 9700 3350
Wire Wire Line
	6300 3050 7050 3050
Wire Wire Line
	7050 3050 7050 2400
Wire Wire Line
	7050 2400 7600 2400
Wire Wire Line
	6300 3150 7100 3150
Wire Wire Line
	7100 3150 7100 2550
Wire Wire Line
	7100 2550 7600 2550
Wire Wire Line
	6300 3250 7150 3250
Wire Wire Line
	7150 3250 7150 2700
Wire Wire Line
	7150 2700 7600 2700
Wire Wire Line
	6300 3350 7250 3350
Wire Wire Line
	7250 3350 7250 2850
Wire Wire Line
	7250 2850 7600 2850
Wire Wire Line
	6300 3450 7300 3450
Wire Wire Line
	7300 3450 7300 3000
Wire Wire Line
	7300 3000 7600 3000
Wire Wire Line
	7350 3500 7350 3150
Wire Wire Line
	7350 3150 7600 3150
Wire Wire Line
	6900 3500 7350 3500
Wire Wire Line
	7450 3550 7450 3300
Wire Wire Line
	7450 3300 7600 3300
Wire Wire Line
	6800 3650 7600 3650
Wire Wire Line
	7600 3650 7600 3450
Wire Wire Line
	7600 3450 7650 3450
Wire Wire Line
	6300 2550 6900 2550
Wire Wire Line
	6900 2550 6900 3500
Wire Wire Line
	6850 2650 6850 3550
Wire Wire Line
	6850 3550 7450 3550
Wire Wire Line
	6300 2750 6800 2750
Wire Wire Line
	6800 2750 6800 3650
Wire Wire Line
	6300 2650 6850 2650
Wire Wire Line
	6300 2450 6600 2450
NoConn ~ 6300 2950
NoConn ~ 4500 2750
$Comp
L power:GND #PWR?
U 1 1 5EDA9BF4
P 3350 2550
F 0 "#PWR?" H 3350 2300 50  0001 C CNN
F 1 "GND" H 3355 2377 50  0000 C CNN
F 2 "" H 3350 2550 50  0001 C CNN
F 3 "" H 3350 2550 50  0001 C CNN
	1    3350 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EDAA834
P 10050 2750
F 0 "#PWR?" H 10050 2500 50  0001 C CNN
F 1 "GND" H 10055 2577 50  0000 C CNN
F 2 "" H 10050 2750 50  0001 C CNN
F 3 "" H 10050 2750 50  0001 C CNN
	1    10050 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2550 3750 2550
Wire Wire Line
	3350 2550 3200 2550
Wire Wire Line
	3200 2550 3200 2350
Connection ~ 3350 2550
$Comp
L power:GND #PWR?
U 1 1 5EDB2582
P 4700 5450
F 0 "#PWR?" H 4700 5200 50  0001 C CNN
F 1 "GND" H 4705 5277 50  0000 C CNN
F 2 "" H 4700 5450 50  0001 C CNN
F 3 "" H 4700 5450 50  0001 C CNN
	1    4700 5450
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EDB2B2A
P 4350 1850
F 0 "#PWR?" H 4350 1700 50  0001 C CNN
F 1 "+3.3V" H 4365 2023 50  0000 C CNN
F 2 "" H 4350 1850 50  0001 C CNN
F 3 "" H 4350 1850 50  0001 C CNN
	1    4350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1850 4350 2050
Connection ~ 4350 2050
Wire Wire Line
	4350 2050 4300 2050
Wire Wire Line
	9700 2750 10050 2750
Wire Wire Line
	10050 2750 10050 2650
Wire Wire Line
	9700 2650 10050 2650
Wire Wire Line
	4300 2050 4300 2200
Connection ~ 4300 2050
Wire Wire Line
	4300 2050 3750 2050
Wire Wire Line
	6600 1900 6600 2450
$Comp
L power:GND #PWR?
U 1 1 5EDD9FED
P 3100 4300
F 0 "#PWR?" H 3100 4050 50  0001 C CNN
F 1 "GND" H 3105 4127 50  0000 C CNN
F 2 "" H 3100 4300 50  0001 C CNN
F 3 "" H 3100 4300 50  0001 C CNN
	1    3100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4100 3500 4100
Connection ~ 3950 3350
Connection ~ 3450 3350
Connection ~ 3100 4300
Connection ~ 3950 4100
Connection ~ 3450 4100
Wire Wire Line
	3950 4100 4500 4100
Wire Wire Line
	4500 3450 4500 4100
$Comp
L Device:R R?
U 1 1 5EE07B7D
P 2750 3000
F 0 "R?" V 2650 3050 50  0000 C CNN
F 1 "10k" V 2850 3100 50  0000 C CNN
F 2 "" V 2680 3000 50  0001 C CNN
F 3 "~" H 2750 3000 50  0001 C CNN
	1    2750 3000
	0    -1   -1   0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5EE09DE4
P 2900 3250
F 0 "C?" H 3078 3296 50  0000 L CNN
F 1 "0.1uF" H 3078 3205 50  0000 L CNN
F 2 "" H 2900 3250 50  0001 C CNN
F 3 "~" H 2900 3250 50  0001 C CNN
	1    2900 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE0BCB0
P 2350 2600
F 0 "R?" V 2557 2600 50  0000 C CNN
F 1 "10k" H 2450 2700 50  0000 C CNN
F 2 "" V 2280 2600 50  0001 C CNN
F 3 "~" H 2350 2600 50  0001 C CNN
	1    2350 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 2750 2350 3000
Wire Wire Line
	2350 3000 2600 3000
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 5EE12D4D
P 2350 3300
F 0 "SW?" V 2304 3430 50  0000 L CNN
F 1 "RESET" V 2395 3430 50  0000 L CNN
F 2 "" H 2350 3300 50  0001 C CNN
F 3 "~" H 2350 3300 50  0001 C CNN
	1    2350 3300
	0    1    1    0   
$EndComp
Connection ~ 2350 3000
Wire Wire Line
	2350 3600 2650 3600
Wire Wire Line
	2900 3600 2900 3500
$Comp
L power:GND #PWR?
U 1 1 5EE15E08
P 2650 3600
F 0 "#PWR?" H 2650 3350 50  0001 C CNN
F 1 "GND" H 2655 3427 50  0000 C CNN
F 2 "" H 2650 3600 50  0001 C CNN
F 3 "" H 2650 3600 50  0001 C CNN
	1    2650 3600
	1    0    0    -1  
$EndComp
Connection ~ 2650 3600
Wire Wire Line
	2650 3600 2900 3600
Connection ~ 2900 3000
$Comp
L MCU_NXP_S08:MC9S08QG8xPBE IC?
U 1 1 5ED6B790
P 5400 2950
F 0 "IC?" H 5400 4031 50  0000 C CNN
F 1 "MC9S08QG8xPBE" H 5400 3940 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5600 2200 50  0001 L CIN
F 3 "http://cache.nxp.com/files/microcontrollers/doc/data_sheet/MC9S08QG8.pdf" H 5500 2750 50  0001 C CNN
	1    5400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2650 4050 3000
Wire Wire Line
	4050 2650 4500 2650
$Comp
L Device:R R?
U 1 1 5EE23748
P 6200 1250
F 0 "R?" V 6100 1300 50  0000 C CNN
F 1 "10k" V 6300 1350 50  0000 C CNN
F 2 "" V 6130 1250 50  0001 C CNN
F 3 "~" H 6200 1250 50  0001 C CNN
	1    6200 1250
	0    -1   -1   0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5EE2374E
P 6350 1500
F 0 "C?" H 6528 1546 50  0000 L CNN
F 1 "0.1uF" H 6528 1455 50  0000 L CNN
F 2 "" H 6350 1500 50  0001 C CNN
F 3 "~" H 6350 1500 50  0001 C CNN
	1    6350 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE23754
P 5800 850
F 0 "R?" V 6007 850 50  0000 C CNN
F 1 "10k" H 5900 950 50  0000 C CNN
F 2 "" V 5730 850 50  0001 C CNN
F 3 "~" H 5800 850 50  0001 C CNN
	1    5800 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	5800 1000 5800 1250
Wire Wire Line
	5800 1250 6050 1250
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 5EE2375E
P 5800 1550
F 0 "SW?" V 5754 1680 50  0000 L CNN
F 1 "RESET" V 5845 1680 50  0000 L CNN
F 2 "" H 5800 1550 50  0001 C CNN
F 3 "~" H 5800 1550 50  0001 C CNN
	1    5800 1550
	0    1    1    0   
$EndComp
Connection ~ 5800 1250
Connection ~ 6350 1250
$Comp
L power:GND #PWR?
U 1 1 5EE23736
P 6200 1900
F 0 "#PWR?" H 6200 1650 50  0001 C CNN
F 1 "GND" H 6100 1750 50  0000 C CNN
F 2 "" H 6200 1900 50  0001 C CNN
F 3 "" H 6200 1900 50  0001 C CNN
	1    6200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1750 6350 1900
Wire Wire Line
	6350 1900 6200 1900
Wire Wire Line
	5800 1900 5800 1850
Connection ~ 6200 1900
Wire Wire Line
	6200 1900 5800 1900
Connection ~ 10050 2750
Wire Wire Line
	7350 1900 6600 1900
Wire Wire Line
	4900 700  4900 2050
Wire Wire Line
	4900 700  5800 700 
Connection ~ 4900 2050
Wire Wire Line
	4900 2050 4350 2050
Wire Wire Line
	3200 2050 2350 2050
Wire Wire Line
	2350 2050 2350 2450
Connection ~ 3200 2050
Wire Wire Line
	7350 1250 7350 1900
Wire Wire Line
	6350 1250 7350 1250
Wire Wire Line
	2900 3000 4050 3000
$EndSCHEMATC
