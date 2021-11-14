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

process(mem_write_en,mem_read, clk)
	begin
	ram_addr <= mem_access_addr(31 downto 2);
	if(rising_edge(clk)) then
	case mem_read is
	when '1' =>
		mem_read_data <= RAM(to_integer(unsigned(ram_addr)));
	when others =>
		RAM(to_integer(unsigned(ram_addr))) <= mem_write_data;
	end case;
	end if;
end process;

end Behavioral;
