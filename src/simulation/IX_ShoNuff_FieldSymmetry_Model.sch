EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END

$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "IX-ShoNuff Triostrut Field Symmetry Model"
Date "2025-07-11"
Rev "v1.0"
Comp "Sho'Nuff 2.0 Project"
Comment1 "Author: Bryce Wooster"
$EndDescr

$Comp
L Device:L_Core L1
U 1 1 60E0FA88
P 2800 2000
F 0 "L1" H 2800 2100 50  0000 C CNN
F 1 "369_Pri_Coil" H 2800 1900 50  0000 C CNN
	1    2800 2000
	1    0    0    -1
$EndComp

$Comp
L Device:L_Core L2
U 1 1 60E0FB88
P 3200 2000
F 0 "L2" H 3200 2100 50  0000 C CNN
F 1 "369_Sec_Coil" H 3200 1900 50  0000 C CNN
	1    3200 2000
	1    0    0    -1
$EndComp

$Comp
L Device:C C1
U 1 1 60E0FC88
P 3000 2300
F 0 "C1" H 3000 2400 50  0000 C CNN
F 1 "Phase_Cap" H 3000 2200 50  0000 C CNN
	1    3000 2300
	1    0    0    -1
$EndComp

$Comp
L power:GND #PWR0101
U 1 1 60E0FD88
P 3000 2600
F 0 "#PWR0101" H 3000 2350 50  0001 C CNN
F 1 "GND" H 3000 2450 50  0000 C CNN
	1    3000 2600
	1    0    0    -1
$EndComp

Wire Wire Line
	2800 2000 3000 2000
Wire Wire Line
	3000 2000 3200 2000
Wire Wire Line
	3000 2000 3000 2100
Wire Wire Line
	3000 2500 3000 2600

Text Label 2800 1950 0    50   ~ 0
Triostrut_Node
Text Label 3200 1950 2    50   ~ 0
Gankyil_Harmonizer

$EndSCHEMATC
