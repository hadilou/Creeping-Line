----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 14:51:13
-- Design Name: 
-- Module Name: bigCounterDecoder - Behavioral
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

entity bigCounterDecoder is
    Port ( inputCounterDecoder : in STD_LOGIC_VECTOR (2 downto 0);
           outputCounterDecoder : out STD_LOGIC_VECTOR (7 downto 0));
end bigCounterDecoder;

architecture Behavioral of bigCounterDecoder is
signal s_input: std_logic_vector(2 downto 0);
signal s_output: std_logic_vector(7 downto 0);
begin
process(inputCounterDecoder)
begin
case inputCounterDecoder is
when "000" => s_output <= B"1111_1110";
when "001" => s_output <= B"1111_1101";
when "010" => s_output <= B"1111_1011";
when "011" => s_output <= B"1111_0111";
when "100" => s_output <= B"1110_1111";
when "101" => s_output <= B"1101_1111";
when "110" => s_output <= B"1011_1111";
when "111" => s_output <= B"0111_1111";
when others =>  NULL;
end case;
end process;
outputCounterDecoder <= s_output ;

end Behavioral;
