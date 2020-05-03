----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 02:53:08
-- Design Name: 
-- Module Name: secondStepTest - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity secondStepTest is
--  Port ( );
end secondStepTest;

architecture Behavioral of secondStepTest is
component secondStep Port(sw0_in: in std_logic;
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
end component;
signal s: std_logic_vector(15 downto 0);
signal s_clk,i:STD_LOGIC:='0';
signal s_output_segment: STD_LOGIC_VECTOR(7 downto 0);
signal s_output_selected: STD_LOGIC_VECTOR(7 downto 0);


begin
uut_second: secondStep Port Map (sw0_in=> s(0) ,
                                 sw1_in=> s(1),
                                 sw2_in=> s(2),
                                 sw3_in=> s(3),
                                 sw4_in=> s(4),
                                 sw5_in=> s(5),
                                 sw6_in=> s(6),
                                 sw7_in=> s(7),
                                 sw8_in=> s(8),
                                 sw9_in=> s(9),
                                 sw10_in=> s(10),
                                 sw11_in=> s(11),
                                 sw12_in=> s(12),
                                 sw13_in=> s(13),
                                 sw14_in=> s(14),
                                 sw15_in=> s(15),
                                 clk_in=> s_clk,
                                 output_segment=> s_output_segment,
                                 output_selected=> s_output_selected);

process
begin
    s<=B"0000_0000_0000_0000";
    wait for 1 ms;
    s<=B"0000_0000_0001_0000";
    wait for 1ms;
    s<=B"0000_0010_0001_0000";
    wait for 1ms;
    s<=B"0011_0010_0001_0000";
    wait;
end process;
process
begin
s_clk<='0';
wait for 5 ns;
s_clk<='1';
wait for 5 ns;
end process;
end Behavioral;
