----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 13:25:39
-- Design Name: 
-- Module Name: shift_register - Behavioral
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

entity shift_register is
  Port (clk: in std_logic;
        outputShift: out std_logic_vector(31 downto 0) );
end shift_register;

architecture Behavioral of shift_register is
signal s_clock: std_logic := '0';
signal s_counterInt: integer range 0 to 999999999;
signal toRotate: std_logic_vector(31 downto 0):=B"0000_0001_0010_0011_0100_0101_0110_0111";
begin
process (clk)
begin
if clk'event and clk = '1' then
    if s_counterInt < 24999999 then --shift every 0.5s
        s_counterInt <= s_counterInt +1;
        s_clock <= '0';
     else 
        s_counterInt <= 0;
        s_clock <= '1';
     end if;
 end if;
end process ;
process(clk,s_clock)
begin
if clk'event and clk = '1' then
    if s_clock = '1' then
        toRotate <= std_logic_vector(unsigned(toRotate) ror 4);--shift rotate right 4
    end if;
end if;
end process;
outputShift <= toRotate;

end Behavioral;
