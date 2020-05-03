----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2019 16:51:56
-- Design Name: 
-- Module Name: fourBitDecoder - Behavioral
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

entity fourBitDecoder is
    Port ( sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           decodedOut: out std_logic_vector (7 downto 0) );
end fourBitDecoder;

architecture Behavioral of fourBitDecoder is
signal BCDin: std_logic_vector (3 downto 0);
signal Seven_Segment: std_logic_vector (7 downto 0);

begin
BCDin <= sw3 & sw2 & sw1 & sw0;
process(BCDin)
begin 

case BCDin is
when "0000" =>Seven_Segment <= B"0000_0011"; ---0
when "0001" =>Seven_Segment <= B"1001_1111"; ---1
when "0010" =>Seven_Segment <= B"0010_0101"; ---2
when "0011" =>Seven_Segment <= B"0000_1101"; ---3
when "0100" =>Seven_Segment <= B"1001_1001"; ---4
when "0101" =>Seven_Segment <= B"0100_1001"; ---5
when "0110" =>Seven_Segment <= B"0100_0001"; ---6
when "0111" =>Seven_Segment <= B"0001_1111"; ---7
when "1000" =>Seven_Segment <= B"0000_0001"; ---8
when "1001" =>Seven_Segment <= B"0000_1001"; ---9
when "1010"=> Seven_Segment <=B"0001_0001";  -- 'A'
when "1011"=> Seven_Segment <=B"1100_0001";  -- 'b'
when "1100"=> Seven_Segment <=B"0110_0011";  -- 'C'
when "1101"=> Seven_Segment <=B"1000_0101";  -- 'd'
when "1110"=> Seven_Segment <=B"0110_0001";  -- 'E'
when "1111"=> Seven_Segment <=B"0111_0001";  -- 'F'
when others =>Seven_Segment <= B"1111_1111"; ---null
end case;
end process;
decodedOut <= Seven_Segment;
end Behavioral;
