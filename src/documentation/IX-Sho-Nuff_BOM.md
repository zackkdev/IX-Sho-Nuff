# IX-Sho-Nuff Project — Bill of Materials (BOM)

**Author:** Bryce Wooster  
**Date:** 2025-07-11  
**Version:** 1.0

---

## Core Electrical Components

| Component                    | Specification                                  | Quantity | Notes                                 |
|-----------------------------|-------------------------------------------------|----------|---------------------------------------|
| FPGA Board                  | Teensy 4.1 / STM32                             | 1        | Feedback loop + coil control          |
| Piezoelectric Sensor Grid   | Quartz or Tourmaline 12-bit compatible         | 1        | Field vibration sensing               |
| Bismuth Core Block          | 2.5" x 2.5" x 1"                               | 1        | Element 115 test mass                 |
| Tesla Coil Set              | Custom-wound 369 coil ratios                   | 3        | Phased @ 120°                         |
| Capacitor Bank              | 500V, 1000uF                                   | 6        | Coil pulse storage                    |
| High Voltage MOSFET Driver  | 500V, 20A                                      | 3        | Tesla coil pulse drive                |
| PCB Material                | FR4, 2-layer                                   | -        | Tesla 369 Coil Controller board      |

---

## Mechanical Components

| Component                    | Specification                                  | Quantity | Notes                                 |
|-----------------------------|-------------------------------------------------|----------|---------------------------------------|
| Toroidal Housing            | Inner: 2.5", Outer: 4"                          | 1        | Field containment structure           |
| Merkabah Cage               | Stainless / Mu-metal, precision-cut            | 1        | Internal field harmonizer             |
| Wedge Pistons               | Non-linear, acoustic/magnetic reciprocation    | 3        | Internal field pulse mechanics        |
| Cryogenic Chamber           | Helium-3/4 Dilution Fridge, sub-Kelvin capable | 1        | Element 115 stabilization layer       |

---

## Control System Components

| Component                    | Specification                                  | Quantity | Notes                                 |
|-----------------------------|-------------------------------------------------|----------|---------------------------------------|
| Feedback Controller PCB     | Custom as per Tesla_369_Coil_Controller.brd    | 1        | FPGA + sensor routing                 |
| Software                    | VHDL, Python, C/C++                             | -        | System integration and monitoring     |

---

## Notes

- All components must be sourced from verified industrial or scientific suppliers.
- No substitute components unless verified through secondary field testing.
- Refer to /src/control_logic and /src/coil_driver for PCB layouts and VHDL code relevant to control.

---

**End of Document**
