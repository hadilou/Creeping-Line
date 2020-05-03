----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2019 23:12:34
-- Design Name: 
-- Module Name: secondStep - Behavioral
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

entity secondStep is
 Port(sw0_in: in std_logic;
       sw1_in: in std_logic;
       sw2_in: in std_logic;
       sw3_in: in std_logic;
       sw4_in: in std_logic;
       sw5_in: in std_logic;
       sw6_in: in std_logic;
       sw7_in: in std_logic;
       sw8_in: in std_logic;
       sw9_in: in std_logic;
       sw10_in: in std_logic;
       sw11_in: in std_logic;
       sw12_in: in std_logic;
       sw13_in: in std_logic;
       sw14_in: in std_logic;
       sw15_in: in std_logic;
       clk_in: in std_logic;
       output_segment: out std_logic_vector(7 downto 0);
       output_selected: out std_logic_vector(7 downto 0));
end secondStep;

architecture Behavioral of secondStep is
component counter is
    Port ( clk : in STD_LOGIC;
           output_Counter : out STD_LOGIC_VECTOR (1 downto 0));
end component;
component multiplexer is
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
end component;
component fourBitDecoder is
    Port ( sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           decodedOut: out std_logic_vector (7 downto 0) );
end component;
component two_bits_decoder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           output_2_bit_decoder : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal s_output_counter: std_logic_vector(1 downto 0);
signal s_output_multiplexer: std_logic_vector(3 downto 0);
signal s_output_2bit_decoder: std_logic_vector(3 downto 0);
begin
counter_entity: counter port map(clk => clk_in,
                       output_counter => s_output_counter );
mult_entity: multiplexer port map(sw0 =>sw0_in,
                                  sw1 =>sw1_in,
                                  sw2 =>sw2_in,
                                  sw3 =>sw3_in,
                                  sw4 =>sw4_in,
                                  sw5 =>sw5_in,
                                  sw6 =>sw6_in,
                                  sw7 =>sw7_in,
                                  sw8 =>sw8_in,
                                  sw9 =>sw9_in,
                                  sw10 =>sw10_in,
                                  sw11 =>sw11_in,
                                  sw12 =>sw12_in,
                                  sw13 =>sw13_in,
                                  sw14 =>sw14_in,
                                  sw15 =>sw15_in,
                                  enable =>s_output_counter,
                                  outputMux => s_output_multiplexer);
decoder_entity: fourBitDecoder port map (sw0 => s_output_multiplexer(0),
                                          sw1 =>s_output_multiplexer(1) ,
                                          sw2 =>s_output_multiplexer(2),
                                          sw3 =>s_output_multiplexer(3),
                                          decodedOut => output_segment);
decoder_2bit: two_bits_decoder port map(a =>s_output_counter(0),
                                        b=>s_output_counter(1),
                                        output_2_bit_decoder =>s_output_2bit_decoder);
                                      
output_selected <= "1111" & s_output_2bit_decoder;                                  
                                  

end Behavioral;
