-- IX-Sho-Nuff 2.0
-- FPGA Temperature Monitoring Module
-- Monitors critical component temperature for system safety
-- Can trigger emergency field dampening if thermal threshold exceeded
-- Copyright (c) 2025 Bryce Wooster
-- License: See /LICENSE for full legal terms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fpga_temperature_monitor is
    Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        temp_input  : in  STD_LOGIC_VECTOR(15 downto 0); -- Raw temp sensor input
        overheat    : out STD_LOGIC
    );
end fpga_temperature_monitor;

architecture Behavioral of fpga_temperature_monitor is

    constant TEMP_THRESHOLD : integer := 850; -- Threshold set to 85.0°C (raw input scaled x10)

    signal temp_value_int : integer;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                overheat <= '0';
            else
                temp_value_int <= to_integer(unsigned(temp_input));
                if temp_value_int >= TEMP_THRESHOLD then
                    overheat <= '1';
                else
                    overheat <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
