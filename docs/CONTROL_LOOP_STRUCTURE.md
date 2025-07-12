# IX-Sho-Nuff Control Loop Structure

This document provides the verified real-world control logic and software flow architecture required for stabilizing Element 115 using IX-Sho-Nuff’s system hardware.

---

## Primary Control System Overview

- **Core Logic Platform:** FPGA (Teensy 4.1 or STM32F7 series MCU for prototyping)
- **Control Method:** Feedback-controlled phased resonance adjustment
- **Sensors:** Piezoelectric array, tuning forks, EM field probes
- **Actuators:** Tesla coils, scalar drivers, cryogenic pumps

---

## Step-by-Step Control Flow

1. **System Boot-Up**
   - Initialize all FPGA logic units.
   - Perform self-check on all sensors and coil drivers.

2. **Baseline Field Sweep**
   - Output baseline Tesla coil field at preset frequency range:  
     **200 kHz → 3 MHz sweep (linear ramp-up)**.
   - Monitor response from piezo grid + EM probes.

3. **Triostrut Lock-in Phase**
   - Engage Triostrut coil sequence.
   - Adjust secondary coil phase delay to maintain lock:
     - Target phase delta tolerance: **±0.05%**.

4. **Cryogenic System Sync**
   - Synchronize cooling cycle timing with coil pulse intervals.
   - Maintain temperature under **0.1 K** with tolerance ±0.005 K.

5. **Gankyil Rotational Feedback Loop**
   - Read real-time vibration and resonance shift via:
     - Piezo grid
     - Tuning fork harmonics
   - Adjust coil phase/voltage/current via:
     - PWM + DAC output channels on FPGA.

6. **Continuous Stabilization Loop**
   - Every **2 ms**:
     - Read all sensors.
     - Adjust all actuator outputs.
     - Log data to external storage or memory buffer.

7. **Shutdown Procedure**
   - Ramp down field generators over **30 seconds** minimum.
   - Bring core temperature up slowly to avoid material stress.

---

## Control Logic Priorities

| Priority | Function                            |
|----------|------------------------------------|
| 1        | Maintain Triostrut field lock       |
| 2        | Maintain Gankyil rotational feedback synchronization |
| 3        | Keep cryogenic temperature constant |
| 4        | Log all data in real time           |

---

## Integration Notes

- Control code for Teensy/STM32 must implement:
  - Real-time interrupt handling
  - PWM frequency adjustment capability
  - High-speed ADC input sampling (minimum **20 kHz**)
- All coil drivers must include overcurrent protection.
- FPGA/MCU firmware must be updated with verified parameters before engaging physical systems.

See `/src/control_systems/firmware/` for exact firmware files.
