EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "DC Bricklet"
Date "2020-10-06"
Rev "2.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2020, T.Schneidemann <tim@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  7700 0    40   ~ 0
Copyright Tinkerforge GmbH 2020.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L tinkerforge:DRILL U103
U 1 1 4C6050A5
P 6450 7450
F 0 "U103" H 6500 7500 60  0001 C CNN
F 1 "DRILL" H 6450 7450 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 6450 7450 60  0001 C CNN
F 3 "" H 6450 7450 60  0001 C CNN
	1    6450 7450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U104
U 1 1 4C6050A2
P 6450 7650
F 0 "U104" H 6500 7700 60  0001 C CNN
F 1 "DRILL" H 6450 7650 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 6450 7650 60  0001 C CNN
F 3 "" H 6450 7650 60  0001 C CNN
	1    6450 7650
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U106
U 1 1 4C60509F
P 6800 7650
F 0 "U106" H 6850 7700 60  0001 C CNN
F 1 "DRILL" H 6800 7650 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 6800 7650 60  0001 C CNN
F 3 "" H 6800 7650 60  0001 C CNN
	1    6800 7650
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U105
U 1 1 4C605099
P 6800 7450
F 0 "U105" H 6850 7500 60  0001 C CNN
F 1 "DRILL" H 6800 7450 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 6800 7450 60  0001 C CNN
F 3 "" H 6800 7450 60  0001 C CNN
	1    6800 7450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:VCC #PWR01
U 1 1 4C5FCFB4
P 6950 850
F 0 "#PWR01" H 6950 950 30  0001 C CNN
F 1 "VCC" H 6950 1000 30  0000 C CNN
F 2 "" H 6950 850 60  0001 C CNN
F 3 "" H 6950 850 60  0001 C CNN
	1    6950 850 
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR02
U 1 1 4C5FCF4F
P 950 2300
F 0 "#PWR02" H 950 2300 30  0001 C CNN
F 1 "GND" H 950 2230 30  0001 C CNN
F 2 "" H 950 2300 60  0001 C CNN
F 3 "" H 950 2300 60  0001 C CNN
	1    950  2300
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:CON-SENSOR2 P101
U 1 1 4C5FCF27
P 950 1750
F 0 "P101" H 1100 2150 60  0000 C CNN
F 1 "CON-SENSOR2" V 1100 1750 60  0000 C CNN
F 2 "kicad-libraries:CON-SENSOR2" H 950 1750 60  0001 C CNN
F 3 "" H 950 1750 60  0001 C CNN
	1    950  1750
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:C C101
U 1 1 54F76B96
P 1550 1150
F 0 "C101" V 1650 1300 50  0000 L CNN
F 1 "10uF" V 1400 1150 50  0000 L CNN
F 2 "kicad-libraries:C0805" H 1550 1150 60  0001 C CNN
F 3 "" H 1550 1150 60  0001 C CNN
	1    1550 1150
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:C C103
U 1 1 54F77AA5
P 2350 1150
F 0 "C103" V 2450 1300 50  0000 L CNN
F 1 "1uF" V 2200 1150 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 2350 1150 60  0001 C CNN
F 3 "" H 2350 1150 60  0001 C CNN
	1    2350 1150
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:GND #PWR03
U 1 1 54F77AEA
P 2350 1600
F 0 "#PWR03" H 2350 1600 30  0001 C CNN
F 1 "GND" H 2350 1530 30  0001 C CNN
F 2 "" H 2350 1600 60  0001 C CNN
F 3 "" H 2350 1600 60  0001 C CNN
	1    2350 1600
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C104
U 1 1 5820FDE6
P 2400 6250
F 0 "C104" V 2450 6000 50  0000 L CNN
F 1 "100nF" V 2250 6150 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 2400 6250 60  0001 C CNN
F 3 "" H 2400 6250 60  0001 C CNN
	1    2400 6250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR05
U 1 1 58210C80
P 2400 6650
F 0 "#PWR05" H 2400 6650 30  0001 C CNN
F 1 "GND" H 2400 6580 30  0001 C CNN
F 2 "" H 2400 6650 60  0001 C CNN
F 3 "" H 2400 6650 60  0001 C CNN
	1    2400 6650
	1    0    0    -1  
$EndComp
Text GLabel 2650 1750 2    60   Output ~ 0
S-CS
Text GLabel 2650 1850 2    60   Output ~ 0
S-CLK
Text GLabel 2650 1950 2    60   Output ~ 0
S-MOSI
Text GLabel 2650 2050 2    60   Input ~ 0
S-MISO
$Comp
L tinkerforge:CONN_01X02 P103
U 1 1 58233528
P 800 4550
F 0 "P103" H 800 4700 50  0000 C CNN
F 1 "BOOT" V 900 4550 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 800 4450 50  0001 C CNN
F 3 "" H 800 4450 50  0000 C CNN
	1    800  4550
	-1   0    0    1   
$EndComp
Text Notes 750  3800 0    39   ~ 0
SPI Slave/CH0\nP0.13 : USIC0_CH0-DX2F : SEL\nP0.14 : USIC0_CH0-DX1A : CLK\nP0.15 : USIC0_CH0-DX0B : MOSI\nP2.0 : USIC0_CH0-DOUT0 : MISO
Wire Wire Line
	950  2300 950  2200
Wire Wire Line
	1400 900  1550 900 
Wire Wire Line
	1400 1650 1400 900 
Wire Wire Line
	1550 900  1550 950 
Connection ~ 1550 900 
Wire Wire Line
	1300 1750 1700 1750
Wire Wire Line
	1300 1850 1700 1850
Wire Wire Line
	1300 1950 1700 1950
Wire Wire Line
	1300 2050 1600 2050
Wire Wire Line
	1300 1650 1400 1650
Wire Wire Line
	1300 1550 1550 1550
Wire Wire Line
	1550 1350 1550 1550
Connection ~ 1550 1550
Wire Wire Line
	2350 1350 2350 1550
Connection ~ 2350 1550
Wire Wire Line
	2350 800  2350 900 
Connection ~ 2350 900 
$Comp
L tinkerforge:XMC1XXX24 U101
U 3 1 58CC2BB9
P 2900 4350
F 0 "U101" H 2800 4600 60  0000 C CNN
F 1 "XMC1XXX" H 2900 4100 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3050 5100 60  0001 C CNN
F 3 "" H 3050 5100 60  0000 C CNN
	3    2900 4350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U101
U 2 1 58CC312F
P 2900 3350
F 0 "U101" H 2800 3900 60  0000 C CNN
F 1 "XMC1XXX" H 2900 2800 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3050 4100 60  0001 C CNN
F 3 "" H 3050 4100 60  0000 C CNN
	2    2900 3350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U101
U 4 1 58CC31C9
P 2900 5250
F 0 "U101" H 2800 5700 60  0000 C CNN
F 1 "XMC1XXX" H 2900 4800 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3050 6000 60  0001 C CNN
F 3 "" H 3050 6000 60  0000 C CNN
	4    2900 5250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U101
U 1 1 58CC3266
P 2900 6300
F 0 "U101" H 2750 6700 60  0000 C CNN
F 1 "XMC1XXX" H 2900 5900 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3050 7050 60  0001 C CNN
F 3 "" H 3050 7050 60  0000 C CNN
	1    2900 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6500 2400 6500
Wire Wire Line
	2400 6450 2400 6500
Wire Wire Line
	2400 5900 2400 6000
Wire Wire Line
	2400 6000 2550 6000
Connection ~ 2400 6000
Wire Wire Line
	2400 6600 2550 6600
NoConn ~ 2550 5300
Connection ~ 2400 6500
Connection ~ 2400 6600
Wire Wire Line
	2450 3600 2550 3600
Wire Wire Line
	2550 3700 2450 3700
Wire Wire Line
	2550 3800 2450 3800
Wire Wire Line
	2450 4900 2550 4900
$Comp
L tinkerforge:GND #PWR07
U 1 1 5828358D
P 1350 4650
F 0 "#PWR07" H 1350 4650 30  0001 C CNN
F 1 "GND" H 1350 4580 30  0001 C CNN
F 2 "" H 1350 4650 60  0001 C CNN
F 3 "" H 1350 4650 60  0001 C CNN
	1    1350 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1750 2650 1750
Wire Wire Line
	2650 1850 2100 1850
Wire Wire Line
	2100 1950 2650 1950
Wire Wire Line
	2650 2050 2100 2050
Text GLabel 2450 3600 0    39   Input ~ 0
S-CS
Text GLabel 2450 3700 0    39   Input ~ 0
S-CLK
Text GLabel 2450 3800 0    39   Input ~ 0
S-MOSI
Text GLabel 2450 4900 0    39   Output ~ 0
S-MISO
$Comp
L tinkerforge:GND #PWR08
U 1 1 59006077
P 1600 2500
F 0 "#PWR08" H 1600 2500 30  0001 C CNN
F 1 "GND" H 1600 2430 30  0001 C CNN
F 2 "" H 1600 2500 60  0001 C CNN
F 3 "" H 1600 2500 60  0001 C CNN
	1    1600 2500
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:+5V #PWR09
U 1 1 59008D94
P 1300 800
F 0 "#PWR09" H 1300 650 50  0001 C CNN
F 1 "+5V" H 1300 940 50  0000 C CNN
F 2 "" H 1300 800 50  0000 C CNN
F 3 "" H 1300 800 50  0000 C CNN
	1    1300 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1450 1300 800 
$Comp
L tinkerforge:R_PACK4 RP101
U 1 1 590B3692
P 1900 2100
F 0 "RP101" H 1900 2550 50  0000 C CNN
F 1 "82" H 1900 2050 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 1900 2100 50  0001 C CNN
F 3 "" H 1900 2100 50  0000 C CNN
	1    1900 2100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C102
U 1 1 590B3753
P 1600 2250
F 0 "C102" V 1700 2400 50  0000 L CNN
F 1 "220pF" V 1450 2250 50  0000 L CNN
F 2 "kicad-libraries:C0402F" H 1600 2250 60  0001 C CNN
F 3 "" H 1600 2250 60  0001 C CNN
	1    1600 2250
	-1   0    0    1   
$EndComp
Connection ~ 1600 2050
Wire Wire Line
	1600 2450 1600 2500
$Comp
L tinkerforge:CONN_01X01 P102
U 1 1 590B4637
P 1350 4400
F 0 "P102" H 1300 4300 50  0000 C CNN
F 1 "DEBUG" V 1450 4400 50  0000 C CNN
F 2 "kicad-libraries:DEBUG_PAD" H 1350 4400 50  0001 C CNN
F 3 "" H 1350 4400 50  0000 C CNN
	1    1350 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 900  2350 900 
Wire Wire Line
	1550 1550 2350 1550
Wire Wire Line
	2350 1550 2350 1600
Wire Wire Line
	2350 900  2350 950 
Wire Wire Line
	2400 6000 2400 6050
Wire Wire Line
	2400 6500 2400 6600
Wire Wire Line
	2400 6600 2400 6650
Wire Wire Line
	1600 2050 1700 2050
Wire Wire Line
	1350 4650 1350 4600
Wire Wire Line
	1000 4600 1350 4600
NoConn ~ 2550 5200
Wire Wire Line
	7500 4750 6350 4750
Text GLabel 6350 4750 0    60   Input ~ 0
PWR-D2
Connection ~ 9550 4100
Wire Wire Line
	9900 4250 9900 4100
Wire Wire Line
	9900 4100 9550 4100
Wire Wire Line
	8050 5200 8050 5150
Wire Wire Line
	7900 5300 8050 5300
Wire Wire Line
	7500 5400 7350 5400
Wire Wire Line
	7500 5200 6350 5200
Connection ~ 7100 5400
Wire Wire Line
	7100 5400 7100 5550
Wire Wire Line
	7350 6100 7350 5950
Wire Wire Line
	7900 4450 8050 4450
Wire Wire Line
	7500 4550 6350 4550
Connection ~ 8050 5400
Connection ~ 7350 5400
Connection ~ 9200 5850
Wire Wire Line
	9300 5650 9300 5850
Wire Wire Line
	9300 5850 9200 5850
Connection ~ 9000 5850
Wire Wire Line
	9100 5850 9100 5650
Connection ~ 8800 5850
Wire Wire Line
	8800 5850 8800 5650
Connection ~ 8900 5850
Wire Wire Line
	8500 5850 8500 5650
Connection ~ 8850 3350
Wire Wire Line
	8950 3650 8950 3350
Wire Wire Line
	8950 3350 8850 3350
Connection ~ 8650 3350
Wire Wire Line
	8750 3350 8750 3650
Wire Wire Line
	7850 3350 7850 3550
Connection ~ 9550 4750
Connection ~ 9550 4550
Wire Wire Line
	10400 4550 9550 4550
Connection ~ 9550 4850
Wire Wire Line
	9550 5050 9550 4950
Connection ~ 9550 4450
Wire Wire Line
	9550 4550 9550 4450
Connection ~ 9550 4350
Connection ~ 9550 4950
Wire Wire Line
	9550 4750 10400 4750
Wire Wire Line
	7850 3950 8050 3950
Wire Wire Line
	8650 3650 8650 3350
Wire Wire Line
	8850 3350 8850 3650
Connection ~ 8750 3350
Wire Wire Line
	8900 6200 8900 5850
Wire Wire Line
	8600 5650 8600 5850
Connection ~ 8600 5850
Wire Wire Line
	9000 5850 9000 5650
Wire Wire Line
	9200 5850 9200 5650
Connection ~ 9100 5850
Connection ~ 8050 6100
Wire Wire Line
	7500 4450 6350 4450
Wire Wire Line
	7500 4650 6350 4650
Wire Wire Line
	7900 4550 8050 4550
Wire Wire Line
	7350 5550 7350 5400
Wire Wire Line
	7100 5950 7100 6100
Wire Wire Line
	7100 6100 7350 6100
Connection ~ 7350 6100
Wire Wire Line
	7500 5100 6350 5100
Wire Wire Line
	8050 5400 7900 5400
Wire Wire Line
	7900 5200 8000 5200
Wire Wire Line
	8000 5200 8000 5100
Wire Wire Line
	8000 5100 8050 5100
Wire Wire Line
	7900 5100 7900 5150
Wire Wire Line
	7900 5150 8050 5150
Wire Wire Line
	9550 4150 9550 4100
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F7EBBE1
P 9900 4250
AR Path="/5F7C86AA/5F7EBBE1" Ref="#PWR?"  Part="1" 
AR Path="/5F7EBBE1" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 9900 4250 40  0001 C CNN
F 1 "AGND" H 9900 4100 50  0000 C CNN
F 2 "" H 9900 4250 60  0001 C CNN
F 3 "" H 9900 4250 60  0001 C CNN
	1    9900 4250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:Rs R?
U 1 1 5F7EBBE7
P 7700 4350
AR Path="/5F7C86AA/5F7EBBE7" Ref="R?"  Part="1" 
AR Path="/5F7EBBE7" Ref="R1"  Part="1" 
F 0 "R1" V 7780 4350 50  0000 C CNN
F 1 "1k" V 7700 4350 39  0000 C CNN
F 2 "kicad-libraries:R0402F" H 7700 4350 60  0001 C CNN
F 3 "" H 7700 4350 60  0001 C CNN
	1    7700 4350
	0    -1   -1   0   
$EndComp
$Comp
L tinkerforge:R_PACK4 RP?
U 1 1 5F7EBBED
P 7700 5450
AR Path="/5F7C86AA/5F7EBBED" Ref="RP?"  Part="1" 
AR Path="/5F7EBBED" Ref="RP2"  Part="1" 
F 0 "RP2" H 7700 5400 40  0000 C CNN
F 1 "1k" H 7700 5650 40  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7700 5450 60  0001 C CNN
F 3 "" H 7700 5450 60  0001 C CNN
	1    7700 5450
	1    0    0    -1  
$EndComp
Text GLabel 6350 5200 0    60   Input ~ 0
PWR-SLEW
Text GLabel 6350 5100 0    60   Input ~ 0
PWR-INV
$Comp
L tinkerforge:ZENER D?
U 1 1 5F7EBBF5
P 7100 5750
AR Path="/5F7C86AA/5F7EBBF5" Ref="D?"  Part="1" 
AR Path="/5F7EBBF5" Ref="D1"  Part="1" 
F 0 "D1" H 7100 5850 50  0000 C CNN
F 1 "Z3.3V" H 7100 5650 40  0000 C CNN
F 2 "kicad-libraries:SOD-123" H 7100 5750 60  0001 C CNN
F 3 "" H 7100 5750 60  0001 C CNN
	1    7100 5750
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:R_PACK4 RP?
U 1 1 5F7EBBFB
P 7700 4400
AR Path="/5F7C86AA/5F7EBBFB" Ref="RP?"  Part="1" 
AR Path="/5F7EBBFB" Ref="RP1"  Part="1" 
F 0 "RP1" H 7700 4850 40  0000 C CNN
F 1 "1k" H 7700 4600 40  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7700 4400 60  0001 C CNN
F 3 "" H 7700 4400 60  0001 C CNN
	1    7700 4400
	1    0    0    1   
$EndComp
NoConn ~ 9550 3950
Text GLabel 6350 4350 0    60   Input ~ 0
PWR-EN
Text GLabel 6350 4650 0    60   Input ~ 0
PWR-D1
Text GLabel 6350 4550 0    60   Input ~ 0
PWR-IN2
Text GLabel 6350 4450 0    60   Input ~ 0
PWR-IN1
$Comp
L tinkerforge:C C?
U 1 1 5F7EBC06
P 7350 5750
AR Path="/5F7C86AA/5F7EBC06" Ref="C?"  Part="1" 
AR Path="/5F7EBC06" Ref="C1"  Part="1" 
F 0 "C1" H 7400 5850 50  0000 L CNN
F 1 "470nF" H 7400 5650 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7350 5750 60  0001 C CNN
F 3 "" H 7350 5750 60  0001 C CNN
	1    7350 5750
	1    0    0    -1  
$EndComp
Text GLabel 6350 5400 0    60   Output ~ 0
PWR-FB
Text GLabel 5300 5300 0    60   Output ~ 0
PWR-STATUS
$Comp
L tinkerforge:C C?
U 1 1 5F7EBC26
P 7850 3750
AR Path="/5F7C86AA/5F7EBC26" Ref="C?"  Part="1" 
AR Path="/5F7EBC26" Ref="C3"  Part="1" 
F 0 "C3" H 7900 3850 50  0000 L CNN
F 1 "100nF" H 7900 3650 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7850 3750 60  0001 C CNN
F 3 "" H 7850 3750 60  0001 C CNN
	1    7850 3750
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:CONN_2 P?
U 1 1 5F7EBC2C
P 10750 4650
AR Path="/5F7C86AA/5F7EBC2C" Ref="P?"  Part="1" 
AR Path="/5F7EBC2C" Ref="P2"  Part="1" 
F 0 "P2" V 10700 4650 40  0000 C CNN
F 1 "green" V 10800 4650 40  0000 C CNN
F 2 "kicad-libraries:OQ_2P" H 10750 4650 60  0001 C CNN
F 3 "" H 10750 4650 60  0001 C CNN
	1    10750 4650
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:A33926 U?
U 1 1 5F7EBC32
P 8800 4650
AR Path="/5F7C86AA/5F7EBC32" Ref="U?"  Part="1" 
AR Path="/5F7EBC32" Ref="U1"  Part="1" 
F 0 "U1" H 8300 5550 60  0000 C CNN
F 1 "MC33926" H 8800 4650 60  0000 C CNN
F 2 "kicad-libraries:PQFN-32" H 8800 4650 60  0001 C CNN
F 3 "" H 8800 4650 60  0001 C CNN
	1    8800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 4100 9550 4050
Wire Wire Line
	7100 5400 6350 5400
Wire Wire Line
	7350 5400 7100 5400
Wire Wire Line
	9200 5850 9100 5850
Wire Wire Line
	9000 5850 8900 5850
Wire Wire Line
	8800 5850 8600 5850
Wire Wire Line
	8900 5850 8900 5650
Wire Wire Line
	8900 5850 8800 5850
Wire Wire Line
	8850 3350 8750 3350
Wire Wire Line
	8650 3350 7850 3350
Wire Wire Line
	9550 4850 9550 4750
Wire Wire Line
	9550 4450 9550 4350
Wire Wire Line
	9550 4350 9550 4250
Wire Wire Line
	9550 4950 9550 4850
Wire Wire Line
	8750 3350 8650 3350
Wire Wire Line
	8600 5850 8500 5850
Wire Wire Line
	9100 5850 9000 5850
Wire Wire Line
	8050 6100 8050 6200
Wire Wire Line
	7350 6100 8050 6100
Wire Wire Line
	9950 1700 9950 1450
Wire Wire Line
	6950 900  7600 900 
Wire Wire Line
	10250 900  9750 900 
Connection ~ 9750 900 
Wire Wire Line
	9750 900  9750 950 
Wire Wire Line
	10250 2350 10250 1650
Connection ~ 7600 900 
Wire Wire Line
	7600 1400 7600 1300
Connection ~ 9000 1800
Wire Wire Line
	9000 1750 9000 1800
Wire Wire Line
	9000 2350 9000 2300
Wire Wire Line
	10250 1250 10250 1100
Wire Wire Line
	9000 1800 8600 1800
Wire Wire Line
	8100 1400 8100 1300
Wire Wire Line
	9950 1450 9750 1450
Connection ~ 9950 1450
Wire Wire Line
	9000 900  9000 1250
Connection ~ 9000 900 
Wire Wire Line
	9950 2350 9950 2100
$Comp
L tinkerforge:ZENER D?
U 1 1 5F8076BB
P 9950 1900
AR Path="/5F7C86AA/5F8076BB" Ref="D?"  Part="1" 
AR Path="/5F8076BB" Ref="D2"  Part="1" 
F 0 "D2" H 9950 2000 50  0000 C CNN
F 1 "Z12V" H 9950 1800 40  0000 C CNN
F 2 "kicad-libraries:SOD-123" H 9950 1900 60  0001 C CNN
F 3 "" H 9950 1900 60  0001 C CNN
	1    9950 1900
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:R R?
U 1 1 5F8076C1
P 9750 1200
AR Path="/5F7C86AA/5F8076C1" Ref="R?"  Part="1" 
AR Path="/5F8076C1" Ref="R5"  Part="1" 
F 0 "R5" V 9830 1200 50  0000 C CNN
F 1 "100k" V 9750 1200 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 9750 1200 60  0001 C CNN
F 3 "" H 9750 1200 60  0001 C CNN
	1    9750 1200
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:MOSFET_N_CH Q?
U 1 1 5F8076C7
P 10150 1450
AR Path="/5F7C86AA/5F8076C7" Ref="Q?"  Part="1" 
AR Path="/5F8076C7" Ref="Q1"  Part="1" 
F 0 "Q1" H 10200 1700 60  0000 R CNN
F 1 "FDS8449" H 10750 1450 60  0000 R CNN
F 2 "kicad-libraries:SOIC-8-MOSFET" H 10150 1450 60  0001 C CNN
F 3 "" H 10150 1450 60  0001 C CNN
	1    10150 1450
	1    0    0    -1  
$EndComp
Text Notes 10650 750  2    60   ~ 0
max 28V/5A
$Comp
L tinkerforge:CP1 C?
U 1 1 5F8076D4
P 7600 1100
AR Path="/5F7C86AA/5F8076D4" Ref="C?"  Part="1" 
AR Path="/5F8076D4" Ref="C2"  Part="1" 
F 0 "C2" H 7650 1200 50  0000 L CNN
F 1 "220µF/35V" H 7650 1000 50  0000 L CNN
F 2 "kicad-libraries:ELKO_83" H 7600 1100 60  0001 C CNN
F 3 "" H 7600 1100 60  0001 C CNN
	1    7600 1100
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:CP1 C?
U 1 1 5F8076DA
P 8100 1100
AR Path="/5F7C86AA/5F8076DA" Ref="C?"  Part="1" 
AR Path="/5F8076DA" Ref="C4"  Part="1" 
F 0 "C4" H 8150 1200 50  0000 L CNN
F 1 "220µF/35V" H 8150 1000 50  0000 L CNN
F 2 "kicad-libraries:ELKO_83" H 8100 1100 60  0001 C CNN
F 3 "" H 8100 1100 60  0001 C CNN
	1    8100 1100
	-1   0    0    -1  
$EndComp
Text GLabel 8600 1800 0    60   Output ~ 0
PWR-VEXT
$Comp
L tinkerforge:R R?
U 1 1 5F8076F3
P 9000 2050
AR Path="/5F7C86AA/5F8076F3" Ref="R?"  Part="1" 
AR Path="/5F8076F3" Ref="R4"  Part="1" 
F 0 "R4" V 9080 2050 50  0000 C CNN
F 1 "1k" V 9000 2050 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 9000 2050 60  0001 C CNN
F 3 "" H 9000 2050 60  0001 C CNN
	1    9000 2050
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:R R?
U 1 1 5F8076F9
P 9000 1500
AR Path="/5F7C86AA/5F8076F9" Ref="R?"  Part="1" 
AR Path="/5F8076F9" Ref="R3"  Part="1" 
F 0 "R3" V 9080 1500 50  0000 C CNN
F 1 "10k" V 9000 1500 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 9000 1500 60  0001 C CNN
F 3 "" H 9000 1500 60  0001 C CNN
	1    9000 1500
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:CONN_2 P?
U 1 1 5F807705
P 10600 1000
AR Path="/5F7C86AA/5F807705" Ref="P?"  Part="1" 
AR Path="/5F807705" Ref="P1"  Part="1" 
F 0 "P1" V 10550 1000 40  0000 C CNN
F 1 "black" V 10650 1000 40  0000 C CNN
F 2 "kicad-libraries:OQ_2P" H 10600 1000 60  0001 C CNN
F 3 "" H 10600 1000 60  0001 C CNN
	1    10600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 900  9000 900 
Wire Wire Line
	7600 900  8100 900 
Wire Wire Line
	8100 900  9000 900 
Connection ~ 8100 900 
Wire Wire Line
	6950 850  6950 900 
Wire Wire Line
	7850 3300 7850 3350
Connection ~ 7850 3350
Wire Wire Line
	5300 5300 5500 5300
Wire Wire Line
	7800 4350 8050 4350
Wire Wire Line
	6350 4350 7600 4350
Wire Wire Line
	8050 5400 8050 5650
Wire Wire Line
	8050 5850 8050 6100
$Comp
L tinkerforge:Rs R?
U 1 1 5F7EBC18
P 8050 5750
AR Path="/5F7C86AA/5F7EBC18" Ref="R?"  Part="1" 
AR Path="/5F7EBC18" Ref="R2"  Part="1" 
F 0 "R2" V 8130 5750 50  0000 C CNN
F 1 "220" V 8050 5750 35  0000 C CNN
F 2 "kicad-libraries:R0603F" H 8050 5750 60  0001 C CNN
F 3 "" H 8050 5750 60  0001 C CNN
	1    8050 5750
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:Rs R?
U 1 1 5F8693BA
P 5500 5200
AR Path="/5F7C86AA/5F8693BA" Ref="R?"  Part="1" 
AR Path="/5F8693BA" Ref="R6"  Part="1" 
F 0 "R6" V 5580 5200 50  0000 C CNN
F 1 "10k" V 5500 5200 39  0000 C CNN
F 2 "kicad-libraries:R0603F" H 5500 5200 60  0001 C CNN
F 3 "" H 5500 5200 60  0001 C CNN
	1    5500 5200
	1    0    0    -1  
$EndComp
Connection ~ 5500 5300
Wire Wire Line
	5500 5300 7500 5300
Text GLabel 2050 4300 0    39   Output ~ 0
PWR-IN1
Text GLabel 2050 4200 0    39   Output ~ 0
PWR-IN2
Wire Wire Line
	2550 4200 2050 4200
Wire Wire Line
	2050 4300 2550 4300
Text GLabel 2300 3100 0    39   Output ~ 0
PWR-EN
Wire Wire Line
	2300 2900 2550 2900
Text GLabel 2300 2900 0    39   Output ~ 0
PWR-D1
Text GLabel 2300 3000 0    39   Output ~ 0
PWR-D2
Wire Wire Line
	2300 3000 2550 3000
Wire Wire Line
	2300 3100 2550 3100
Text GLabel 2300 3200 0    39   Input ~ 0
PWR-STATUS
Wire Wire Line
	2300 3200 2550 3200
Text GLabel 2300 3300 0    39   Output ~ 0
PWR-SLEW
Wire Wire Line
	2300 3300 2550 3300
Text GLabel 2300 3400 0    39   Output ~ 0
PWR-INV
Wire Wire Line
	2300 3400 2550 3400
Text GLabel 2450 5500 0    39   Input ~ 0
PWR-FB
Wire Wire Line
	2450 5600 2550 5600
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8ED849
P 8050 6200
AR Path="/5F7C86AA/5F8ED849" Ref="#PWR?"  Part="1" 
AR Path="/5F8ED849" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 8050 6200 40  0001 C CNN
F 1 "AGND" H 8050 6050 50  0000 C CNN
F 2 "" H 8050 6200 60  0001 C CNN
F 3 "" H 8050 6200 60  0001 C CNN
	1    8050 6200
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8EE71A
P 8900 6200
AR Path="/5F7C86AA/5F8EE71A" Ref="#PWR?"  Part="1" 
AR Path="/5F8EE71A" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 8900 6200 40  0001 C CNN
F 1 "AGND" H 8900 6050 50  0000 C CNN
F 2 "" H 8900 6200 60  0001 C CNN
F 3 "" H 8900 6200 60  0001 C CNN
	1    8900 6200
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8EFF02
P 7600 1400
AR Path="/5F7C86AA/5F8EFF02" Ref="#PWR?"  Part="1" 
AR Path="/5F8EFF02" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 7600 1400 40  0001 C CNN
F 1 "AGND" H 7600 1250 50  0000 C CNN
F 2 "" H 7600 1400 60  0001 C CNN
F 3 "" H 7600 1400 60  0001 C CNN
	1    7600 1400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8F33FC
P 8100 1400
AR Path="/5F7C86AA/5F8F33FC" Ref="#PWR?"  Part="1" 
AR Path="/5F8F33FC" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 8100 1400 40  0001 C CNN
F 1 "AGND" H 8100 1250 50  0000 C CNN
F 2 "" H 8100 1400 60  0001 C CNN
F 3 "" H 8100 1400 60  0001 C CNN
	1    8100 1400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8F37DD
P 9950 2350
AR Path="/5F7C86AA/5F8F37DD" Ref="#PWR?"  Part="1" 
AR Path="/5F8F37DD" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 9950 2350 40  0001 C CNN
F 1 "AGND" H 9950 2200 50  0000 C CNN
F 2 "" H 9950 2350 60  0001 C CNN
F 3 "" H 9950 2350 60  0001 C CNN
	1    9950 2350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8F3AA8
P 10250 2350
AR Path="/5F7C86AA/5F8F3AA8" Ref="#PWR?"  Part="1" 
AR Path="/5F8F3AA8" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 10250 2350 40  0001 C CNN
F 1 "AGND" H 10250 2200 50  0000 C CNN
F 2 "" H 10250 2350 60  0001 C CNN
F 3 "" H 10250 2350 60  0001 C CNN
	1    10250 2350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8F4261
P 9000 2350
AR Path="/5F7C86AA/5F8F4261" Ref="#PWR?"  Part="1" 
AR Path="/5F8F4261" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 9000 2350 40  0001 C CNN
F 1 "AGND" H 9000 2200 50  0000 C CNN
F 2 "" H 9000 2350 60  0001 C CNN
F 3 "" H 9000 2350 60  0001 C CNN
	1    9000 2350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR011
U 1 1 5F8F6D50
P 4650 2950
F 0 "#PWR011" H 4650 2950 30  0001 C CNN
F 1 "GND" H 4650 2880 30  0001 C CNN
F 2 "" H 4650 2950 60  0001 C CNN
F 3 "" H 4650 2950 60  0001 C CNN
	1    4650 2950
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:AGND #PWR?
U 1 1 5F8F73C9
P 5200 2950
AR Path="/5F7C86AA/5F8F73C9" Ref="#PWR?"  Part="1" 
AR Path="/5F8F73C9" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 5200 2950 40  0001 C CNN
F 1 "AGND" H 5200 2800 50  0000 C CNN
F 2 "" H 5200 2950 60  0001 C CNN
F 3 "" H 5200 2950 60  0001 C CNN
	1    5200 2950
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:INDUCTs L1
U 1 1 5F8F8257
P 4950 2800
F 0 "L1" V 4804 2800 31  0000 C CNN
F 1 "FB" V 4866 2800 31  0000 C CNN
F 2 "kicad-libraries:0603F" H 4950 2800 60  0001 C CNN
F 3 "" H 4950 2800 60  0000 C CNN
	1    4950 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 2950 4650 2800
Wire Wire Line
	4650 2800 4850 2800
Wire Wire Line
	5050 2800 5200 2800
Wire Wire Line
	5200 2800 5200 2950
Wire Wire Line
	7900 4650 7950 4650
Wire Wire Line
	7950 4650 7950 4750
Wire Wire Line
	7950 4750 8050 4750
Wire Wire Line
	8050 4650 8050 4700
Wire Wire Line
	8050 4700 7900 4700
Wire Wire Line
	7900 4700 7900 4750
Text GLabel 2450 5600 0    39   Input ~ 0
PWR-VEXT
Wire Wire Line
	2450 5500 2550 5500
$Comp
L tinkerforge:3V3 #PWR0101
U 1 1 5F81517B
P 2350 800
F 0 "#PWR0101" H 2350 650 50  0001 C CNN
F 1 "3V3" H 2365 973 50  0000 C CNN
F 2 "" H 2350 800 50  0000 C CNN
F 3 "" H 2350 800 50  0000 C CNN
	1    2350 800 
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:VCC #PWR0102
U 1 1 5F81CFE2
P 7850 3300
F 0 "#PWR0102" H 7850 3400 30  0001 C CNN
F 1 "VCC" H 7850 3450 30  0000 C CNN
F 2 "" H 7850 3300 60  0001 C CNN
F 3 "" H 7850 3300 60  0001 C CNN
	1    7850 3300
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR0104
U 1 1 5F82294A
P 2400 5900
F 0 "#PWR0104" H 2400 5750 50  0001 C CNN
F 1 "3V3" H 2415 6073 50  0000 C CNN
F 2 "" H 2400 5900 50  0000 C CNN
F 3 "" H 2400 5900 50  0000 C CNN
	1    2400 5900
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR0105
U 1 1 5F82AD8A
P 5500 5100
F 0 "#PWR0105" H 5500 4950 50  0001 C CNN
F 1 "3V3" H 5515 5273 50  0000 C CNN
F 2 "" H 5500 5100 50  0000 C CNN
F 3 "" H 5500 5100 50  0000 C CNN
	1    5500 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4400 2550 4400
Wire Wire Line
	1000 4500 2550 4500
$Comp
L tinkerforge:3V3 #PWR0103
U 1 1 5F82022D
P 700 5550
F 0 "#PWR0103" H 700 5400 50  0001 C CNN
F 1 "3V3" H 715 5723 50  0000 C CNN
F 2 "" H 700 5550 50  0000 C CNN
F 3 "" H 700 5550 50  0000 C CNN
	1    700  5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  5600 700  5550
Wire Wire Line
	750  5600 700  5600
Wire Wire Line
	1250 5600 1150 5600
$Comp
L tinkerforge:R R101
U 1 1 5898C45C
P 1500 5600
F 0 "R101" V 1580 5600 50  0000 C CNN
F 1 "1k" V 1500 5600 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 1500 5600 60  0001 C CNN
F 3 "" H 1500 5600 60  0000 C CNN
	1    1500 5600
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:LED D101
U 1 1 5823347E
P 950 5600
F 0 "D101" H 950 5700 50  0000 C CNN
F 1 "blue" H 950 5500 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 950 5600 50  0001 C CNN
F 3 "" H 950 5600 50  0000 C CNN
	1    950  5600
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR04
U 1 1 5F80C3E5
P 700 5000
F 0 "#PWR04" H 700 4850 50  0001 C CNN
F 1 "3V3" H 715 5173 50  0000 C CNN
F 2 "" H 700 5000 50  0000 C CNN
F 3 "" H 700 5000 50  0000 C CNN
	1    700  5000
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:LED D3
U 1 1 5F80C63B
P 950 5100
F 0 "D3" H 950 5200 50  0000 C CNN
F 1 "red" H 950 5000 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 950 5100 50  0001 C CNN
F 3 "" H 950 5100 50  0000 C CNN
	1    950  5100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R7
U 1 1 5F80C9C1
P 1500 5100
F 0 "R7" V 1580 5100 50  0000 C CNN
F 1 "1k" V 1500 5100 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 1500 5100 60  0001 C CNN
F 3 "" H 1500 5100 60  0000 C CNN
	1    1500 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 5000 2550 5000
Text Notes 850  4950 0    60   ~ 0
Error
Text Notes 850  5450 0    60   ~ 0
Status
Wire Wire Line
	700  5000 700  5100
Wire Wire Line
	700  5100 750  5100
Wire Wire Line
	1150 5100 1250 5100
Wire Wire Line
	1750 5100 2250 5100
Wire Wire Line
	2250 5000 2250 5100
Wire Wire Line
	1750 5600 1750 5400
Wire Wire Line
	1750 5400 2550 5400
$EndSCHEMATC
