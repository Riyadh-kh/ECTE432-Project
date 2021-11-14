library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bit_Slicer is
port (
  instruction: in std_logic_vector(31 downto 0);
  opcode: out std_logic_vector(5 downto 0);
  RS, RT, RD: out std_logic_vector(4 downto 0);
  immediate: out std_logic_vector(15 downto 0)
 );
end Bit_Slicer;

architecture Behavioral of Bit_Slicer is

begin

process(instruction) is
begin
opcode <= instruction(31 downto 26);
RS <= instruction(25 downto 21);
RT <= instruction(20 downto 16);
RD <= instruction(15 downto 11);
immediate <= instruction(15 downto 0);

end process;

end Behavioral;