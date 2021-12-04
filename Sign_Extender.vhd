library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sign_Extender is
    Port ( Num_Signed : in STD_LOGIC_VECTOR (15 downto 0);
           Out_32 : out STD_LOGIC_VECTOR (31 downto 0));
end Sign_Extender;

architecture Behavioral of Sign_Extender is

begin

process(Num_Signed) is
begin

Out_32(15 downto 0) <= Num_Signed(15 downto 0);
if Num_Signed(15) = '1' then
Out_32(31 downto 16) <= x"FFFF";
else
Out_32(31 downto 16) <= x"0000";
end if;

end process;

end Behavioral;

