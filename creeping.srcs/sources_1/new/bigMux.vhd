----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 14:42:03
-- Design Name: 
-- Module Name: bigMux - Behavioral
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

entity bigMux is
    Port ( inputMux : in STD_LOGIC_VECTOR (31 downto 0);
           enableMux : in STD_LOGIC_VECTOR (2 downto 0);
           outputMux : out STD_LOGIC_VECTOR (3 downto 0));
end bigMux;

architecture Behavioral of bigMux is
signal b: std_logic_vector(3 downto 0);

begin
process(enableMux,inputMux)--sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9,sw10,sw11,sw12,sw13,sw14,sw15)
begin
case enableMux is
when "000" =>
b <= inputMux(3 downto 0);
when "001" => 
b <= inputMux(7 downto 4);
when "010" =>
b <= inputMux(11 downto 8);
when "011" =>
b <=  inputMux(15 downto 12);
when "100" =>
b <=  inputMux(19 downto 16);
when "101" =>
b <=  inputMux(23 downto 20);
when "110" =>
b <=  inputMux(27 downto 24);
when "111" =>
b <=  inputMux(31 downto 28);
when others =>  null;
end case;
end process ;
outputMux <= b;

end Behavioral;
