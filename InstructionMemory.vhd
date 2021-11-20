library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;
entity InstructionMemory is
 port(
 addr : in std_logic_vector ( 31 downto 0 );
 inst : out std_logic_vector ( 31 downto 0 ));
end InstructionMemory ;
architecture behavior of InstructionMemory is
 begin
 inst_mem:
 process(addr)
 subtype word is std_logic_vector(31 downto 0);
 type mem_array is array(natural range <>) of word;
 variable memory: mem_array(0 to 16) :=
(X"20080005", -- addi $t0, $zero, 5
 X"20090006", -- addi $t1, $zero, 6
 X"00005020", -- add $t2, $zero, $zero
 X"3c0b1000", -- lui $t3, 0x1000
 X"200c0001", -- addi $t4, $zero, 1
 X"00006820", -- add $t5, $zero, $zero
 X"ad6a0000", -- sw $t2, 0 ($t3)
 X"8d6a0000", -- lw $t2, 0 ($t3)
 X"014b6824", -- and $t5, $t2, $t3
 X"014b6825", -- or $t5, $t2, $t3
 X"01485020", -- add $t2, $t2, $t0
 X"012c4822", -- sub $t1, $t1, $t4
 X"216b0004", -- addi $t3, $t3, 4
 X"ad6a0000", -- sw $t2, 0 ($t3)
 X"012c682a", -- slt $t5, $t1, $t4
 X"11a0fff8", -- beq $t5, $zero, loop
 X"00000000"); -- empty instruction
 
 variable word_addr : natural;
 begin
 word_addr := conv_integer(addr(31 downto 2));
 inst <= memory(word_addr);
 end process inst_mem;
 end architecture behavior;
