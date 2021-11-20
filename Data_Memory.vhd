library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Data_Memory is
port (
	clk: in std_logic;
	mem_access_addr: in std_logic_Vector(31 downto 0);
	mem_write_data: in std_logic_Vector(31 downto 0);
	mem_write_en,mem_read: in std_logic;
	mem_read_data: out std_logic_Vector(31 downto 0)
);
end Data_Memory;

architecture Behavioral of Data_Memory is

signal ram_addr: std_logic_vector(29 downto 0);
type data_mem is array (0 to 15) of std_logic_vector (31 downto 0);
signal RAM: data_mem :=((others=> (others=>'0')));

begin
	ram_addr <= mem_access_addr(31 downto 2);
process(clk)
	begin
	if(rising_edge(clk)) then
	if (mem_write_en='1') then
		RAM(to_integer(unsigned(ram_addr))) <= mem_write_data;
	end if;
	end if;
end process;
		mem_read_data <= RAM(to_integer(unsigned(ram_addr))) when (mem_read='1') else x"00000000";
end Behavioral;
