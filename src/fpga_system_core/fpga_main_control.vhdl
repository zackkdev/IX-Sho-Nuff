-- IX-Sho-Nuff 2.0
-- FPGA Main Control Logic
-- Copyright (c) 2025 Bryce Wooster
-- License: See /LICENSE for full legal terms.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fpga_main_control is
    Port (
        clk                : in  STD_LOGIC;
        reset              : in  STD_LOGIC;
        phase_input        : in  STD_LOGIC_VECTOR(15 downto 0);
        acoustic_input     : in  STD_LOGIC_VECTOR(15 downto 0);
        temp_input         : in  STD_LOGIC_VECTOR(15 downto 0);
        coil_drive_out     : out STD_LOGIC_VECTOR(15 downto 0);
        acoustic_drive_out : out STD_LOGIC_VECTOR(15 downto 0)
    );
end fpga_main_control;

architecture Behavioral of fpga_main_control is

    -- PID Control Constants
    constant P_GAIN_PHASE    : integer := 75;
    constant I_GAIN_PHASE    : integer := 15;
    constant D_GAIN_PHASE    : integer := 5;

    constant P_GAIN_ACOUSTIC : integer := 120;
    constant I_GAIN_ACOUSTIC : integer := 30;
    constant D_GAIN_ACOUSTIC : integer := 10;

    -- Registers
    signal phase_error       : integer := 0;
    signal acoustic_error    : integer := 0;
    signal phase_integral    : integer := 0;
    signal acoustic_integral : integer := 0;

    -- Setpoints
    constant PHASE_TARGET    : integer := 12000;  -- Represents 120.00° * 100
    constant ACOUSTIC_TARGET : integer := 14300;  -- Represents 14.3 kHz * 100

begin

    process(clk, reset)
    begin
        if reset = '1' then
            phase_integral    <= 0;
            acoustic_integral <= 0;
            coil_drive_out    <= (others => '0');
            acoustic_drive_out <= (others => '0');
        elsif rising_edge(clk) then

            -- Phase Control PID Logic
            phase_error <= PHASE_TARGET - to_integer(unsigned(phase_input));
            phase_integral <= phase_integral + phase_error;

            coil_drive_out <= std_logic_vector(to_unsigned(
                (P_GAIN_PHASE * phase_error + I_GAIN_PHASE * phase_integral) / 100,
                16
            ));

            -- Acoustic Control PID Logic
            acoustic_error <= ACOUSTIC_TARGET - to_integer(unsigned(acoustic_input));
            acoustic_integral <= acoustic_integral + acoustic_error;

            acoustic_drive_out <= std_logic_vector(to_unsigned(
                (P_GAIN_ACOUSTIC * acoustic_error + I_GAIN_ACOUSTIC * acoustic_integral) / 100,
                16
            ));

        end if;
    end process;

end Behavioral;
