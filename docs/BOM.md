# IX-Sho-Nuff: Bill of Materials (BOM)

This document lists all verified real-world components required to build a functional IX-Sho-Nuff Element 115 Stabilization Prototype.

**No speculative or fictional items are included.**

---

## Core Materials

| Item                                | Specification                                  | Source Example            |
|-------------------------------------|------------------------------------------------|--------------------------|
| Bismuth Core Cylinder               | Pure Bismuth, machined 2.5" x 4" toroidal shape | McMaster-Carr, Online Metals |
| Mu-Metal Shielding Shell            | Custom machined to Triostrut pattern            | Magnetic Shield Corp     |
| Cryogenic Cooling System            | Helium-3/Helium-4 Dilution Refrigerator         | Oxford Instruments       |
| Quartz Plates                       | Laser-cut, piezo-compatible                     | Thorlabs                 |
| Tourmaline Plates                   | Laser-cut, piezo-compatible                     | eBay Industrial          |

---

## Electromagnetic Components

| Item                                | Specification                                  | Source Example            |
|-------------------------------------|------------------------------------------------|--------------------------|
| Tesla Coil Primary                  | Copper tubing, 1/4" diameter, ~10 turns        | Custom Build / TeslaParts |
| Tesla Coil Secondary                | 1500–1800 turns, AWG-30 magnet wire            | Custom Build / TeslaParts |
| Scalar Resonance Driver             | Custom coil geometry per Triostrut math         | In-house Fabrication      |
| FPGA Control Board                  | Teensy 4.1 or STM32F7 series                    | PJRC / ST Microelectronics |
| Piezoelectric Sensor Grid           | Multi-plate piezo array                         | SparkFun, Digikey         |

---

## Resonance and Feedback Hardware

| Item                                | Specification                                  | Source Example            |
|-------------------------------------|------------------------------------------------|--------------------------|
| Tuning Fork Array                   | Custom steel forks, 120 Hz–3600 Hz              | Custom Machine Shop       |
| Wedge Piston Assemblies             | Curved magnetic or acoustic pulse guides        | In-house Fabrication      |
| Capacitor Bank                      | 50,000 µF+, 450V rated                          | Vishay / KEMET            |
| High-Speed Oscilloscope             | 2 GHz+ bandwidth, 4-channel minimum             | Tektronix / Keysight      |
| Spectrum Analyzer                   | Up to 20 GHz                                   | R&S / Keysight            |

---

## Safety Systems

| Item                                | Specification                                  | Source Example            |
|-------------------------------------|------------------------------------------------|--------------------------|
| EM Field Shielding Cage             | Copper mesh, Mu-metal, Faraday integration      | Custom Build              |
| Cryogenic Protective Gear           | Standard sub-K PPE                              | Fisher Scientific         |
| EM Monitoring Probes                | Electric + Magnetic field probes                | R&S / Tektronix           |

---

## Notes:

- **Cryogenic Cooling** is non-optional for long-term stability tests.
- **FPGA/MCU control hardware must run verified field-stabilization code from this repository.**
- **All component values are subject to final experimental tuning per site conditions.**

For full schematics and circuit diagrams, see `/docs/schematics/` folder in this repository.
