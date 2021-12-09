library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Forwarding_Unit is
port (

	EX_MEM_Rd: in std_logic_vector(4 downto 0);
	MEM_WB_Rd: in std_logic_vector(4 downto 0);
	EX_MEM_RegWrite: in std_logic;
	MEM_WB_RegWrite: in std_logic;
	ID_EX_Rs: in std_logic_vector(4 downto 0);
	ID_EX_Rt: in std_logic_vector(4 downto 0);
	forwardA: out std_logic_vector(1 downto 0);
	forwardB: out std_logic_vector(1 downto 0)
);
end Forwarding_Unit;

architecture Behavioral of Forwarding_Unit is

begin

process(EX_MEM_Rd, MEM_WB_Rd, EX_MEM_RegWrite, MEM_WB_RegWrite, ID_EX_Rs, ID_EX_Rt)
begin

if (MEM_WB_RegWrite ='1' and MEM_WB_Rd=ID_EX_Rs) then
forwardA <= "10";
elsif (EX_MEM_RegWrite = '1' and EX_MEM_Rd=ID_EX_Rs) then
forwardA <= "01";
else
forwardA<= "00";
end if;

if (MEM_WB_RegWrite ='1' and ID_EX_Rt=MEM_WB_Rd) then
forwardb <= "10";
elsif (EX_MEM_RegWrite = '1' and ID_EX_Rt=EX_MEM_Rd) then
forwardB <= "01";
else
forwardB<= "00";
end if;

end process;

end Behavioral;