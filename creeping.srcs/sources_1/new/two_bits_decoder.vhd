----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2019 01:00:37
-- Design Name: 
-- Module Name: two_bits_decoder - Behavioral
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

entity two_bits_decoder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           output_2_bit_decoder : out STD_LOGIC_VECTOR (3 downto 0));
end two_bits_decoder;

architecture Behavioral of two_bits_decoder is
signal s_input: std_logic_vector(1 downto 0);
signal s_output: std_logic_vector(3 downto 0);
begin
s_input <= b&a;

process(s_input)
begin
case s_input is
when "00" => s_output <= "1110";
when "01" => s_output <= "1101";
when "10" => s_output <= "1011";
when "11" => s_output <= "0111";
when others => s_output<= s_output;
end case;
end process;
output_2_bit_decoder <= s_output ;

end Behavioral;
