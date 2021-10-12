library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity regfile is
 port (
 readreg1 : in std_logic_vector ( 4 downto 0 );
 readreg2 : in std_logic_vector ( 4 downto 0 );
 writereg : in std_logic_vector ( 4 downto 0 );
 writedata : in std_logic_vector ( 31 downto 0 );
 regwrite : in std_logic;
 clk : in std_logic;
 data1 : out std_logic_vector ( 31 downto 0 );
 data2 : out std_logic_vector ( 31 downto 0 )
 );
end regfile;
architecture Behavioral of regfile is
type registerFile is array(0 to 31) of std_logic_vector(31 downto
0);
signal registers : registerFile;
 begin
 data1 <= registers(to_integer(unsigned(readreg1)));
 data2 <= registers(to_integer(unsigned(readreg2)));

 process (clk) is

 begin
 if rising_edge(clk) then
 if regwrite = '1' then
 registers(to_integer(unsigned(writereg))) <= writedata;
 end if;

 end if;

 end process;
end Behavioral;