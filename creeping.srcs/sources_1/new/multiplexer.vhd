----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2019 23:46:48
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
 Port(sw0: in std_logic;
       sw1: in std_logic;
       sw2: in std_logic;
       sw3: in std_logic;
       sw4: in std_logic;
       sw5: in std_logic;
       sw6: in std_logic;
       sw7: in std_logic;
       sw8: in std_logic;
       sw9: in std_logic;
       sw10: in std_logic;
       sw11: in std_logic;
       sw12: in std_logic;
       sw13: in std_logic;
       sw14: in std_logic;
       sw15: in std_logic;
       enable: in std_logic_vector(1 downto 0);
       outputMux: out std_logic_vector(3 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is
signal b: std_logic_vector(3 downto 0);

begin
process(enable)--sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9,sw10,sw11,sw12,sw13,sw14,sw15)
begin
if enable ="00" then
 b <= sw3 & sw2 & sw1 & sw0;
elsif enable= "01" then
b <=  sw7 & sw6 & sw5 &sw4;
elsif enable = "10" then
b <=  sw11 & sw10 & sw9 &sw8;
elsif enable = "11" then
b <=  sw15 & sw14 & sw13 &sw12;
end if;
end process;
outputMux <= b;

end Behavioral;
