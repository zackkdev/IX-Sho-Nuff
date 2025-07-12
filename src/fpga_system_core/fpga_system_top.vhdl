-- IX-Sho-Nuff 2.0
-- FPGA System Top Module
-- Integrates all FPGA control submodules into unified architecture
-- Manages pulse width modulation, temperature monitoring, and system state outputs
-- Fully synchronous design for stable, low-latency field control
-- Copyright (c) 2025 Bryce Wooster
-- License: See /LICENSE for full legal terms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.fpga_signal_definitions.all;

entity fpga_system_top is
    Port (
        clk            : in  STD_LOGIC;
        reset          : in  STD_LOGIC;
        pwm_phase_out  : out STD_LOGIC;
        pwm_acoustic_out : out STD_LOGIC;
        overheat_flag  : out STD_LOGIC
    );
end fpga_system_top;

architecture Structural of fpga_system_top is

    -- Internal signal wiring
    signal phase_control_value    : phase_signal := (others => '0');
    signal acoustic_control_value : acoustic_signal := (others => '0');
    signal temperature_value      : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

    -- Phase PWM Generator
    phase_pwm: entity work.fpga_pwm_generator
        port map (
            clk        => clk,
            reset      => reset,
            duty_cycle => phase_control_value,
            pwm_out    => pwm_phase_out
        );

    -- Acoustic PWM Generator
    acoustic_pwm: entity work.fpga_pwm_generator
        port map (
            clk        => clk,
            reset      => reset,
            duty_cycle => acoustic_control_value,
            pwm_out    => pwm_acoustic_out
        );

    -- Temperature Monitor
    temp_monitor: entity work.fpga_temperature_monitor
        port map (
            clk        => clk,
            reset      => reset,
            temp_input => temperature_value,
            overheat   => overheat_flag
        );

end Structural;
