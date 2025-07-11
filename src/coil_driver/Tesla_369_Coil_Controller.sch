EESchema Schematic File Version 4
LIBS:Tesla_369_Coil_Controller
EELAYER 29 0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title "IX-Sho-Nuff Tesla 369 Coil Driver"
Date "2025-07-11"
Rev "v1.0"
Comp "Bryce Wooster"
Comment1 "Core pulse driver circuit for harmonic coil emissions"
Comment2 "Tesla 3-6-9 phase-timed signal boost"
$EndDescr

$Comp
L Device:R R1
U 1 1 60BEE0F1
P 2000 1500
F 0 "R1" V 1900 1500 50  0000 C CNN
F 1 "10k" V 2100 1500 50  0000 C CNN
F 2 "" H 2000 1500 50  0001 C CNN
F 3 "" H 2000 1500 50  0001 C CNN
	1    2000 1500
	0    -1   -1   0
$EndComp

$Comp
L Device:C C1
U 1 1 60BEE111
P 2300 1500
F 0 "C1" H 2400 1500 50  0000 L CNN
F 1 "1uF" H 2300 1400 50  0000 L CNN
F 2 "" H 2300 1500 50  0001 C CNN
F 3 "" H 2300 1500 50  0001 C CNN
	1    2300 1500
	0    -1   -1   0
$EndComp

$Comp
L Device:Q_NPN_BCE Q1
U 1 1 60BEE127
P 2600 1400
F 0 "Q1" H 2800 1400 50  0000 L CNN
F 1 "2N2222" H 2800 1300 50  0000 L CNN
F 2 "" H 2800 1300 50  0001 C CNN
F 3 "" H 2800 1300 50  0001 C CNN
	1    2600 1400
	-1   0    0   -1
$EndComp

$Comp
L Device:Coil L1
U 1 1 60BEE13D
P 3000 1200
F 0 "L1" H 3100 1200 50  0000 L CNN
F 1 "Custom Tesla Winding" H 3000 1100 50  0000 L CNN
F 2 "" H 3000 1200 50  0001 C CNN
F 3 "" H 3000 1200 50  0001 C CNN
	1    3000 1200
	1    0    0   -1
$EndComp

$Comp
L power:GND #PWR01
U 1 1 60BEE150
P 2600 1800
F 0 "#PWR01" H 2600 1550 50  0001 C CNN
F 1 "GND" H 2600 1650 50  0000 C CNN
F 2 "" H 2600 1800 50  0001 C CNN
F 3 "" H 2600 1800 50  0001 C CNN
	1    2600 1800
	1    0    0   -1
$EndComp

Text GLabel 1900 1500 0    50   Input ~ 0
FPGA_369_SIGNAL

Wire Wire Line
	1900 1500 2000 1500
Wire Wire Line
	2100 1500 2300 1500
Wire Wire Line
	2500 1500 2600 1500
Wire Wire Line
	2600 1600 2600 1800
Wire Wire Line
	2800 1400 3000 1200

$EndSCHEMATC
