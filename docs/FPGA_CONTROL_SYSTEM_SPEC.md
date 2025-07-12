# FPGA Control System Specification — IX-Sho-Nuff

This document provides a full technical specification for the FPGA-based control system that operates the IX-Sho-Nuff core stabilization subsystems, including pin mappings, control flow, and system behavior.

---

## FPGA Model

**Recommended Base Hardware:**

- Model: Teensy 4.1 or STM32H7 Series
- Clock Speed: 600 MHz minimum
- I/O Voltage: 3.3V logic
- Peripheral Interfaces:
  - PWM (≥8 channels)
  - ADC (≥4 channels, 12-bit+)
  - DAC (≥2 channels)
  - UART / USB / CAN for debugging

---

## System Functional Blocks

| Block                    | Function                                             |
|------------------------|------------------------------------------------------|
| Coil Driver Control     | Phased PWM output to Tesla, Triostrut, Gankyil coils |
| Sensor Feedback System  | Reads vibration, EM field, temperature sensors       |
| Cryogenic Regulation    | DAC control of pump power and flow                   |
| Phase-Lock Feedback     | Real-time adjustment of pulse timings                |
| System Health Monitor   | Logs system voltage, temperature, timing errors      |

---

## Pin Assignments

| Pin Function         | FPGA Pin              | Voltage Level |
|---------------------|----------------------|---------------|
| Triostrut Coil A    | PWM1 (Pin 2)          | 3.3V logic    |
| Triostrut Coil B    | PWM2 (Pin 3)          | 3.3V logic    |
| Triostrut Coil C    | PWM3 (Pin 4)          | 3.3V logic    |
| Gankyil Coils       | PWM4, PWM5, PWM6      | 3.3V logic    |
| EM Field Sensor     | ADC1 (Pin 24)         | 0–3.3V        |
| Vibration Sensor    | ADC2 (Pin 25)         | 0–3.3V        |
| Temperature Sensor  | ADC3 (Pin 26)         | 0–3.3V        |
| Cryo Pump Control   | DAC1 (Pin 33)         | 0–3.3V        |
| Debug UART          | TX/RX (Pins 0, 1)     | 3.3V logic    |

---

## Control Logic Flow

1. **Initialization**
    - Set PWM frequency to **20–150 kHz range** depending on coil type.
    - Perform sensor calibration baseline.

2. **Operational Loop**
    - Continuously read:
      - EM field strength
      - Vibration signature
      - Core temperature
    - Adjust PWM duty cycle and phase in real-time using:
      - PID control on vibration drift
      - Phase-Locked Loop (PLL) logic for Tesla/Gankyil timing alignment

3. **Emergency Shutdown**
    - If any critical sensor parameter exceeds threshold (e.g., +10% temp spike), cut all coil outputs immediately.

4. **Logging and Debugging**
    - Stream sensor data via UART to connected PC.
    - Maintain local log buffer in FPGA flash for post-analysis.

---

## Recommended Firmware Base

- Language: C / C++ (Teensyduino or STM32Cube)
- Libraries:
  - Teensy PWM and ADC libraries
  - FreeRTOS (optional for task splitting)
  - Custom PID/PLL loop code

---

## Safety and Isolation

- **Opto-Isolation** required between FPGA output pins and final high-voltage coil drivers.
- Use separate 5V isolated power supply for sensor inputs.
- Ensure metal enclosures are grounded to prevent EM backfeed to FPGA board.

---

## Notes

This control system specification is designed to meet real-world engineering standards, providing complete hardware/software integration details for replicating IX-Sho-Nuff’s core stabilization behavior in laboratory or prototype environments.

All system tuning parameters (PWM ranges, PID constants, sensor calibration) are field-adjustable via firmware updates.

