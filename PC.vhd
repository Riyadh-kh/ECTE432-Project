library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
port (
  PC_IN: in std_logic_vector(31 downto 0);
  PC_OUT : out std_logic_vector(31 downto 0);
  clk: in std_logic
 );
end PC;

architecture Behavioral of PC is

begin

process(clk) is
begin
if rising_edge(clk) then
PC_OUT <= PC_IN;
end if;
end process;
end Behavioral;