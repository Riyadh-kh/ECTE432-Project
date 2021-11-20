----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2021 01:46:09 PM
-- Design Name: 
-- Module Name: ALU_Control - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Control is
    Port ( Fnc : in STD_LOGIC_VECTOR (5 downto 0);
           ALUop : in STD_LOGIC_VECTOR (1 downto 0);
           Operation : out STD_LOGIC_VECTOR (3 downto 0));
end ALU_Control;

architecture Behavioral of ALU_Control is

begin
process(Fnc, ALUop) is
begin

case ALUop is
when "00" => -- Additions (I Type)
Operation <= "0010";
when "01" => -- Substractions (I Type)
Operation <= "0110";
when "11" => -- LUI Operation
Operation <= "0011";
when "10" => -- R Type instructions, check fnc code
if Fnc(3 downto 0) = "0000" then  -- addition fnc code is 20, hence we only care to see 0000 in the end
Operation <= "0010";
elsif Fnc(3 downto 0) = "0010" then -- Substraction fnc code
Operation <= "0110";
elsif Fnc(3 downto 0) = "0100" then -- AND Operation fnc code
Operation <= "0000";
elsif Fnc(3 downto 0) = "0101" then -- OR Operation fnc code
Operation <= "0001";
elsif Fnc(3 downto 0) = "1010" then -- SLT Operation fnc code
Operation <= "0111";
end if;
when others =>
Operation <= "0000";
end case;

end process;


end Behavioral;
