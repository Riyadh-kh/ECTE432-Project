library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
port (
  PC_IN: in std_logic_vector(31 downto 0);
  PC_OUT : out std_logic_vector(31 downto 0)
 );
end PC;

architecture Behavioral of PC is

begin

PC_OUT <= PC_IN;

end Behavioral;