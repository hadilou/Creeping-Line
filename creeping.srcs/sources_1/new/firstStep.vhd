----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2019 16:48:24
-- Design Name: 
-- Module Name: firstStep - Behavioral
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

entity firstStep is
    Port ( sw0_in : in STD_LOGIC;
           sw1_in : in STD_LOGIC;
           sw2_in : in STD_LOGIC;
           sw3_in : in STD_LOGIC;
           output: out STD_LOGIC_VECTOR(7 downto 0);
           selectedSeven: out STD_LOGIC_vector (7 DOWNTO 0) );
end firstStep;


architecture Behavioral of firstStep is
component fourBitDecoder is
    Port ( sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           decodedOut: out std_logic_vector (7 downto 0) );
end component;
signal s_decodedOut: std_logic_vector (7 downto 0);
begin

decod: fourBitDecoder port map (sw0 => sw0_in,
                            sw1 => sw1_in,
                            sw2 => sw2_in,
                            sw3 => sw3_in,
                            decodedOut=> s_decodedOut);

selectedSeven <= "00000100";       
output <= s_decodedOut;       

end Behavioral;
