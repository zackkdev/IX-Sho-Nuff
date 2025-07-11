-- IX-Sho-Nuff Piezoelectric Feedback Controller
-- Author: Bryce Wooster
-- Date: 2025-07-11
-- Description: Real-time piezo sensor input processing and field pulse adjustment.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IX_ShoNuff_Piezo_Feedback_Controller is
    Port ( clk            : in  STD_LOGIC;
           reset          : in  STD_LOGIC;
           piezo_input    : in  STD_LOGIC_VECTOR(11 downto 0);
           control_output : out STD_LOGIC_VECTOR(7 downto 0));
end IX_ShoNuff_Piezo_Feedback_Controller;

architecture Behavioral of IX_ShoNuff_Piezo_Feedback_Controller is

    signal feedback_value   : unsigned(11 downto 0);
    signal control_reg      : unsigned(7 downto 0);

begin

    process(clk, reset)
    begin
        if reset = '1' then
            feedback_value <= (others => '0');
            control_reg    <= (others => '0');
        elsif rising_edge(clk) then
            feedback_value <= unsigned(piezo_input);

            -- Simple proportional control for frequency adjustment
            if feedback_value > to_unsigned(2048, 12) then
                control_reg <= control_reg + 1;
            elsif feedback_value < to_unsigned(2048, 12) then
                control_reg <= control_reg - 1;
            end if;
        end if;
    end process;

    control_output <= std_logic_vector(control_reg);

end Behavioral;
