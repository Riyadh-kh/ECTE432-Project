library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity mipsalu is
 port (
 a : in std_logic_vector ( 31 downto 0 );
 b : in std_logic_vector ( 31 downto 0 );
 aluctl : in std_logic_vector ( 3 downto 0 );
 aluout : out std_logic_vector( 31 downto 0 );
 z : out std_logic
 );
end mipsalu;
architecture Behavioral of mipsalu is
signal reg_a : signed( 31 downto 0 ) := (others => '0');
signal reg_b : signed( 31 downto 0 ) := (others => '0');
signal reg_res : signed( 31 downto 0 ) := (others => '0');
begin
reg_a <= signed(a);
reg_b <= signed(b);
aluout <= std_logic_vector(reg_res);
process(reg_a, reg_b, aluctl) is
begin
z <= '0';
case aluctl is
when "0000" =>
reg_res <= reg_a and reg_b;
when "0001" =>
reg_res <= reg_a or reg_b;
when "0010" =>
 reg_res <= reg_a + reg_b;
when "0110" =>
reg_res <= reg_a - reg_b;

when "0111" =>
 if (a < b) then
 reg_res <= to_signed(1,reg_res'length);
 else
 reg_res <= to_signed(0,reg_res'length);
 end if;
when "1100" =>
reg_res <= reg_a nor reg_b;
when others =>
reg_res <= to_signed(0,reg_res'length);
end case;
if (reg_res = 0) then
 z <= '1';
end if;
end process;
end Behavioral;