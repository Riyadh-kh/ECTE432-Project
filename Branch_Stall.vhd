library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Branch_Stall is
port (
	Branch: in std_logic;
	PCSTALL: out std_logic;
	reset: out std_logic
);
end Branch_Stall;

architecture Behavioral of Branch_Stall is

begin

process(Branch) is
begin

if (Branch='1') then
PCSTALL <= '1';
reset <= '1';
elsif (Branch='0') then
PCSTALL <= '0';
reset <= '0';
end if;
end process;
end Behavioral;