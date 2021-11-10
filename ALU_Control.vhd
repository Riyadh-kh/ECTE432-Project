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
           Operation : out STD_LOGIC_VECTOR (2 downto 0));
end ALU_Control;

architecture Behavioral of ALU_Control is

begin
process(Fnc, ALUop) is
begin

case ALUop is
when "00" =>
Operation <= "010";
when "01" =>
Operation <= "110";
when others =>
if Fnc(3 downto 0) = "0000" then
Operation <= "010";
end if;
end case;

end process;


end Behavioral;
