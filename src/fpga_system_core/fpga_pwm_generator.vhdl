-- IX-Sho-Nuff 2.0
-- FPGA PWM Generator Module
-- Outputs high-resolution pulse-width modulation signals for coil and acoustic drivers
-- Pulse timing directly linked to stabilized phase and acoustic setpoints
-- Copyright (c) 2025 Bryce Wooster
-- License: See /LICENSE for full legal terms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.fpga_signal_definitions.all;

entity fpga_pwm_generator is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        duty_cycle : in  STD_LOGIC_VECTOR(15 downto 0);
        pwm_out    : out STD_LOGIC
    );
end fpga_pwm_generator;

architecture Behavioral of fpga_pwm_generator is

    signal counter      : unsigned(15 downto 0) := (others => '0');
    signal duty_compare : unsigned(15 downto 0);

begin

    duty_compare <= unsigned(duty_cycle);

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter   <= (others => '0');
                pwm_out   <= '0';
            else
                counter <= counter + 1;
                if counter < duty_compare then
                    pwm_out <= '1';
                else
                    pwm_out <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
