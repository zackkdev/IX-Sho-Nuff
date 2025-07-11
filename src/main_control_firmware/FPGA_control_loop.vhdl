-- IX-Sho-Nuff FPGA Control Loop
-- Author: Bryce Wooster
-- Date: 2025-07-11
-- Description: Core harmonic field stabilization loop. Real-time pulse control + feedback for Triostrut Node.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IX_ShoNuff_FPGA_Control is
    Port ( clk          : in  STD_LOGIC;
           reset        : in  STD_LOGIC;
           pulse_out    : out STD_LOGIC_VECTOR(2 downto 0);
           feedback_in  : in  STD_LOGIC_VECTOR(11 downto 0));
end IX_ShoNuff_FPGA_Control;

architecture Behavioral of IX_ShoNuff_FPGA_Control is

    signal counter        : unsigned(23 downto 0) := (others => '0');
    signal pulse_control  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

    -- Frequency dividers for 369 harmonic pulse timing
    constant DIV_3  : unsigned(23 downto 0) := to_unsigned(5000000, 24); 
    constant DIV_6  : unsigned(23 downto 0) := to_unsigned(2500000, 24);
    constant DIV_9  : unsigned(23 downto 0) := to_unsigned(1666666, 24);

begin

    process(clk, reset)
    begin
        if reset = '1' then
            counter       <= (others => '0');
            pulse_control <= (others => '0');
        elsif rising_edge(clk) then
            counter <= counter + 1;

            -- Pulse generation logic using Tesla 369 timing structure
            if counter = DIV_3 then
                pulse_control(0) <= not pulse_control(0);
            elsif counter = DIV_6 then
                pulse_control(1) <= not pulse_control(1);
            elsif counter = DIV_9 then
                pulse_control(2) <= not pulse_control(2);
                counter <= (others => '0');
            end if;
        end if;
    end process;

    pulse_out <= pulse_control;

end Behavioral;
