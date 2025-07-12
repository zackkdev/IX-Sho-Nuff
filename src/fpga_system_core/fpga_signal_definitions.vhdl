-- IX-Sho-Nuff 2.0
-- FPGA Signal Definitions Module
-- Copyright (c) 2025 Bryce Wooster
-- License: See /LICENSE for full legal terms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This file declares all core signal types and constants used across the FPGA system

package fpga_signal_definitions is

    -- System-wide Constants
    constant CLOCK_FREQUENCY    : integer := 100_000_000; -- 100 MHz FPGA system clock
    constant PHASE_RESOLUTION   : integer := 16; -- 16-bit resolution for phase data
    constant ACOUSTIC_RESOLUTION: integer := 16; -- 16-bit resolution for acoustic feedback

    -- Type Declarations
    subtype phase_signal is STD_LOGIC_VECTOR(PHASE_RESOLUTION-1 downto 0);
    subtype acoustic_signal is STD_LOGIC_VECTOR(ACOUSTIC_RESOLUTION-1 downto 0);

    -- Scalar/Acoustic Setpoint Constants (pre-multiplied by 100 for integer PID math)
    constant DEFAULT_PHASE_TARGET    : integer := 12000; -- 120.00 degrees
    constant DEFAULT_ACOUSTIC_TARGET : integer := 14300; -- 14.3 kHz

end fpga_signal_definitions;
