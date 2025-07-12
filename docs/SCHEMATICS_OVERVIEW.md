# IX-Sho-Nuff Schematics Overview

This document provides a detailed verbal description of the complete system schematics for IX-Sho-Nuff, including layout logic and component interconnections, formatted for clarity in environments where file uploads of actual schematic images may not be permitted.

---

## System Layout: High-Level

**Core Zone:**
- Element 115 sample positioned in center toroidal chamber
- Surrounding components (from inner to outer):
  - Bismuth Core Shell
  - Triostrut Coil Array (x3 coils, 120° apart)
  - Gankyil Node Coils (stacked over Triostrut)
  - Mu-metal Shield Layer
  - External EM Containment Cage

**Peripheral Zone:**
- Tesla Coil Primary and Secondary units placed 18" apart from core chamber
- FPGA Control Board mounted externally with:
  - Cryogenic Controller Interface
  - Sensor Feedback Ports
  - Coil Driver Outputs

---

## Component Interconnection Summary

| Component                | Connected To                        | Notes                            |
|------------------------|------------------------------------|----------------------------------|
| Tesla Coil Primary     | Tesla Secondary, FPGA control       | Inductive driver system          |
| Tesla Coil Secondary   | Triostrut/Gankyil coil array        | Delivers phased harmonic pulses  |
| Triostrut Coil Array   | FPGA control + Tesla Secondary      | Primary stabilization driver     |
| Gankyil Node Coils     | FPGA control                        | Rotational correction feedback   |
| Piezo Sensor Grid      | FPGA sensor ports                   | Real-time vibration feedback     |
| Cryogenic System       | FPGA temp control ports             | Synchronization loop             |

---

## Control System Wiring Logic

- **FPGA → Coil Drivers**
  - PWM outputs directly control coil drivers (3-phase configuration).
- **FPGA → Sensor Array**
  - High-speed ADC channels sample piezo + EM probe data.
- **FPGA → Cryogenic System**
  - DAC output regulates cryogenic pump power levels.

**Critical Notes:**
- Shield all control lines using twisted-pair or coaxial cabling.
- Maintain physical separation between power lines and sensor lines to minimize interference.
- Use optical isolators between FPGA and high-voltage coil drivers.

---

## Recommended Connector Types

| Use Case                    | Connector Standard             |
|----------------------------|-------------------------------|
| Coil Power Lines           | XT60 or Anderson PowerPole     |
| Sensor Data Lines          | SMA or BNC connectors          |
| FPGA Programming/Debugging | USB-C, JTAG                    |
| Cryogenic System Control   | DB15 industrial connector      |

---

## System Footprint

- Total volume: approx. **4 ft x 4 ft x 4 ft**
- Minimum clearance required: **6 ft radius** around the system for safe operation and field stability.

---

## Notes

- For detailed firmware diagrams, refer to `/src/control_systems/firmware/`.
- Physical schematic diagrams (if allowed by environment) should be created using KiCAD or similar software with all above parameters.

This file is intended as a full verbal substitute for physical schematics where image files or PDFs are restricted.
