-- IX-Sho-Nuff 2.0
-- FPGA Top-Level Integration Module
-- Combines all subsystems into a functional core unit
-- Copyright (c) 2025 Bryce Wooster
-- License: See /LICENSE for full legal terms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.fpga_signal_definitions.all;

entity fpga_top_level is
    Port (
        clk                : in  STD_LOGIC;
        reset              : in  STD_LOGIC;
        raw_phase_sensor   : in  phase_signal;
        raw_acoustic_sensor: in  acoustic_signal;
        coil_drive_pwm     : out phase_signal;
        acoustic_drive_pwm : out acoustic_signal
    );
end fpga_top_level;

architecture Structural of fpga_top_level is

    -- Component Declarations
    component fpga_main_control
        Port (
            clk                : in  STD_LOGIC;
            reset              : in  STD_LOGIC;
            phase_input        : in  phase_signal;
            acoustic_input     : in  acoustic_signal;
            temp_input         : in  STD_LOGIC_VECTOR(15 downto 0);
            coil_drive_out     : out phase_signal;
            acoustic_drive_out : out acoustic_signal
        );
    end component;

    signal temp_dummy : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

    -- Main Control Core Instantiation
    MainControlCore : fpga_main_control
        port map (
            clk                => clk,
            reset              => reset,
            phase_input        => raw_phase_sensor,
            acoustic_input     => raw_acoustic_sensor,
            temp_input         => temp_dummy,
            coil_drive_out     => coil_drive_pwm,
            acoustic_drive_out => acoustic_drive_pwm
        );

end Structural;
