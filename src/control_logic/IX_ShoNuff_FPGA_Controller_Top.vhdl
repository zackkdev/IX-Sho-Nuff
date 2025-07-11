-- IX-Sho-Nuff FPGA Top-Level Controller
-- Author: Bryce Wooster
-- Date: 2025-07-11
-- Description: Main control architecture integrating all submodules.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IX_ShoNuff_FPGA_Controller_Top is
    Port ( clk          : in  STD_LOGIC;
           reset        : in  STD_LOGIC;
           piezo_input  : in  STD_LOGIC_VECTOR(11 downto 0);
           coil_output  : out STD_LOGIC_VECTOR(7 downto 0));
end IX_ShoNuff_FPGA_Controller_Top;

architecture Structural of IX_ShoNuff_FPGA_Controller_Top is

    signal feedback_control : STD_LOGIC_VECTOR(7 downto 0);

    component IX_ShoNuff_Piezo_Feedback_Controller
        Port ( clk            : in  STD_LOGIC;
               reset          : in  STD_LOGIC;
               piezo_input    : in  STD_LOGIC_VECTOR(11 downto 0);
               control_output : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

begin

    FeedbackLoop: IX_ShoNuff_Piezo_Feedback_Controller
        Port Map ( clk            => clk,
                   reset          => reset,
                   piezo_input    => piezo_input,
                   control_output => feedback_control);

    -- Simple pass-through: coil drive control driven directly from feedback loop
    coil_output <= feedback_control;

end Structural;
