----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2019 17:50:06
-- Design Name: 
-- Module Name: firstStepTest - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity firstStepTest is
--  Port ( );
end firstStepTest;

architecture Behavioral of firstStepTest is
component firstStep is
    Port ( sw0_in : in STD_LOGIC;
           sw1_in : in STD_LOGIC;
           sw2_in : in STD_LOGIC;
           sw3_in : in STD_LOGIC;
           output: out STD_LOGIC_VECTOR(7 downto 0);
           selectedSeven: out STD_LOGIC_VECTOR (7 DOWNTO 0) );
end component;

signal s_sw0: std_logic:='0';
signal s_sw1: std_logic:='0';
signal s_sw2: std_logic:='0';
signal s_sw3 : std_logic:='0';
signal s_output: std_logic_vector(7 downto 0);
signal s_selectedOutput: std_logic_vector(7 downto 0);
begin

uut_firstStep: firstStep port map (sw0_in =>s_sw0,
                         sw1_in =>s_sw1,
                         sw2_in =>s_sw2,
                         sw3_in =>s_sw3,
                         output =>s_output,
                         selectedSeven => s_selectedOutput);
 process
 begin
 s_sw0 <= '0';
 wait for 10 ns;
 s_sw0 <= '1';
 wait for 10 ns;
 end process; 
 process                       
 begin
 s_sw1 <= '0';
 wait for 20 ns;
 s_sw1 <= '1';
 wait for 20 ns;
 end process;
 process  
  begin
 s_sw2 <= '0';
 wait for 40 ns;
 s_sw2 <= '1';
 wait for 40 ns;
 end process;
 process  
  begin
 s_sw3 <= '0';
 wait for 80 ns;
 s_sw3 <= '1';
 wait for 80 ns;
 end process;
end Behavioral;
