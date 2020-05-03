----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2019 00:02:54
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    Port ( clk : in STD_LOGIC;
           output_counter : out STD_LOGIC_VECTOR (1 downto 0));
end counter;

architecture Behavioral of counter is
signal s_clock_1Mhz: std_logic := '0';
signal s_counterInt: integer range 0 to 999999999;
signal s_Q: STD_LOGIC_VECTOR (1 downto 0):="00";

begin

process (clk)
begin
if clk'event and clk = '1' then
    if s_counterInt < 99999 then  --1ms
        s_counterInt <= s_counterInt +1;
        s_clock_1Mhz <= '0';
     else 
        s_counterInt <= 0;
        s_clock_1Mhz <= '1';
     end if;
 end if;
end process ;

process(clk)
begin

if clk'event and clk = '1' then
    if s_clock_1Mhz='1' then
        s_Q <= STD_LOGIC_VECTOR(UNSIGNED( s_Q) +1);
        end if;
end if;


--if s_Q = "11" then
--s_Q <= "00";
--end if;
end process;
output_counter  <= s_Q;
end Behavioral;
