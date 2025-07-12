-- IX-Sho-Nuff 2.0
-- FPGA Signal Definitions Package
-- Centralized signal type declarations for coherent system-wide signal management
-- Supports phase control, acoustic control, temperature monitoring across modules
-- Copyright (c) 2025 Bryce Wooster
-- License: See /LICENSE for full legal terms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package fpga_signal_definitions is

    -- Define phase control signal type (16-bit for precision PWM control)
    subtype phase_signal is STD_LOGIC_VECTOR(15 downto 0);

    -- Define acoustic control signal type (16-bit for precision PWM control)
    subtype acoustic_signal is STD_LOGIC_VECTOR(15 downto 0);

    -- Define general control bus (32-bit)
    subtype control_bus is STD_LOGIC_VECTOR(31 downto 0);

end fpga_signal_definitions;

package body fpga_signal_definitions is
    -- No body content required for simple type definitions
end fpga_signal_definitions;
