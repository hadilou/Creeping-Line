----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 17:41:30
-- Design Name: 
-- Module Name: thirdStepTest - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity thirdStepTest is
end thirdStepTest;

architecture Behavioral of thirdStepTest is
component thirdStep is
  Port (clk_in: in std_logic;
        outputSegment: out std_logic_vector(7 downto 0);
        outputSelected: out std_logic_vector(7 downto 0) );
end component;
signal s_clk: std_logic;
signal s_outputSegment: std_logic_vector(7 downto 0);
signal s_outputSelected: std_logic_vector(7 downto 0);
begin

uut_third_step: thirdStep port map (clk_in => s_clk,
                                   outputSegment=>s_outputSegment,
                                   outputSelected => s_outputSelected);
                                   
                                   
  process 
  begin
  s_clk <= '0';
  wait for 10 ns;
  s_clk <= '1';
  wait for 10 ns;
  end process;                                 
end Behavioral;
