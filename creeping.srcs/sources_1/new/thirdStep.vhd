----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 13:15:26
-- Design Name: 
-- Module Name: thirdStep - Behavioral
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

entity thirdStep is
  Port (clk_in: in std_logic;
        outputSegment: out std_logic_vector(7 downto 0);
        outputSelected: out std_logic_vector(7 downto 0) );
end thirdStep;

architecture Behavioral of thirdStep is
component bigMux is
    Port ( inputMux : in STD_LOGIC_VECTOR (31 downto 0);
           enableMux : in STD_LOGIC_VECTOR (2 downto 0);
           outputMux : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component shift_register is
  Port (clk: in std_logic;
        outputShift: out std_logic_vector(31 downto 0) );
end component;
component threeBitCounter is
    Port ( clk : in STD_LOGIC;
           counter_Output : out STD_LOGIC_VECTOR (2 downto 0));
end component;
component bigCounterDecoder is
    Port ( inputCounterDecoder : in STD_LOGIC_VECTOR (2 downto 0);
           outputCounterDecoder : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component fourBitDecoder is
    Port ( sw0 : in STD_LOGIC:='0';
           sw1 : in STD_LOGIC:='0';
           sw2 : in STD_LOGIC:='0';
           sw3 : in STD_LOGIC:='0';
           decodedOut: out std_logic_vector (7 downto 0):="00000000" );
end component;

signal s_outputShift: std_logic_vector(31 downto 0);
signal s_counter_output: std_logic_vector(2 downto 0);
signal s_output_mux: std_logic_vector(3 downto 0);
begin

uut_shift_register: shift_register port map (clk => clk_in,
                                             outputShift =>s_outputShift);
                                             
uut_counter: threeBitCounter Port Map(clk => clk_in,
                                      counter_Output =>s_counter_output);
uut_mux: bigMux Port map (inputMux => s_outputShift,
                           enableMux => s_counter_output,
                           outputMux => s_output_mux);
                           
uut_decoder: fourBitDecoder port map (sw0=>s_output_mux(0),
                                      sw1=>s_output_mux(1),
                                      sw2=>s_output_mux(2),
                                      sw3=>s_output_mux(3),
                                      decodedOut =>outputSegment);

uut_counter_decoder: bigCounterDecoder port map (inputCounterDecoder => s_counter_output,
                                                 outputCounterDecoder => outputSelected);
                                      

end Behavioral;
