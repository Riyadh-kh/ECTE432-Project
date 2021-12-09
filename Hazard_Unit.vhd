library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Hazard_Unit is
port (

	ID_EX_MemRead: in std_logic;
	ID_EX_Rt: in std_logic_vector(4 downto 0);
	IF_ID_Rs: in std_logic_vector(4 downto 0);
	IF_ID_Rt: in std_logic_vector(4 downto 0);
	nop: out std_logic;
	PCWrite: out std_logic;
	ID_IF_Write: out std_logic
);
end Hazard_Unit;

architecture Behavioral of Hazard_Unit is

begin

process(ID_EX_MemRead, IF_ID_Rs, ID_EX_Rt, IF_ID_Rt) is

begin

if (ID_EX_MemRead='1') and (IF_ID_Rs = ID_EX_Rt) then
	nop<='1';
	PCWrite<='0';
	ID_IF_Write<='0';
elsif  (ID_EX_MemRead='1') and (IF_ID_Rt = ID_EX_Rt) then
	nop<='1';
	PCWrite<='0';
	ID_IF_Write<='0';
elsif (ID_EX_MemRead='0') then
	nop<='0';
	PCWrite<='1';
	ID_IF_Write<='1';
end if;

end process;

end Behavioral;