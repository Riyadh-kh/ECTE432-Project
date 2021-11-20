library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
port (
  opcode: in std_logic_vector(5 downto 0);
  alu_op : out std_logic_vector(1 downto 0);
  reg_dst,mem_to_reg,jump,branch,mem_read,mem_write,reg_write,alu_src: out std_logic
 );
end Control_Unit;

architecture Behavioral of Control_Unit is

begin
process(opcode)
begin
if opcode= "000000" then -- R Type Instructions
	reg_dst <= '1';
	mem_to_reg <= '0';
	jump <= '0';
	branch <= '0';
	mem_read <= '0';
	mem_write <= '0';
	reg_write <= '1';
	alu_src <= '0';
	alu_op <= "10"; -- Check Function Code in ALU Control
elsif opcode= "001000" then -- addi Instruction (I Type)
	reg_dst <= '0';
	mem_to_reg <= '0';
	jump <= '0';
	branch <= '0';
	mem_read <= '0';
	mem_write <= '0';
	reg_write <= '1';
	alu_src <= '1';
	alu_op <= "00"; -- 00 is defined in ALU_Control for addition
elsif opcode= "001111" then -- lui Instruction (I Type)
	reg_dst <= '0';
	mem_to_reg <= '0';
	jump <= '0';
	branch <= '0';
	mem_read <= '0';
	mem_write <= '0';
	reg_write <= '1';
	alu_src <= '1';
	alu_op <= "11"; -- 11 is defined in ALU_Control for lui instruction
elsif opcode= "101011" then -- sw Instruction (I Type)
	reg_dst <= '0'; -- Dont care
	mem_to_reg <= '0'; -- Dont care
	jump <= '0';
	branch <= '0';
	mem_read <= '0';
	mem_write <= '1';
	reg_write <= '0';
	alu_src <= '1';
	alu_op <= "00"; -- 00 as sw works the same way addition does 
elsif opcode = "100011" then -- lw Instruction (I Type)
	reg_dst <= '0';
	mem_to_reg <= '1';
	jump <= '0';
	branch <= '0';
	mem_read <= '1';
	mem_write <= '0';
	reg_write <= '1';
	alu_src <= '1';
	alu_op <= "00"; -- 00 as lw works the same way addition does 
elsif opcode = "000100" then -- beq Instruction (I Type)
	reg_dst <= '0';
	mem_to_reg <= '0';
	jump <= '0';
	branch <= '1';
	mem_read <= '0';
	mem_write <= '0';
	reg_write <= '0';
	alu_src <= '0';
	alu_op <= "01"; -- 00 as lw works the same way substraction does 
end if;
end process;
end Behavioral;
