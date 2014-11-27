library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity instructions_memory is
	generic (
		length: integer := 256;
		address_width: integer := 32;
		data_width: integer := 32);

	port (
    clock, enable: in std_logic;
		address_to_read: in std_logic_vector (address_width - 1 downto 0);
		instruction_out: out std_logic_vector (data_width - 1 downto 0));
end instructions_memory;

architecture behavioral of instructions_memory is

	type instructions_sequence is array (0 to length) of std_logic_vector (data_width - 1 downto 0);
	signal instructions: instructions_sequence :=
		-- inicio : lw $t0, 0($0)
   (0 => X"8C080000",
		-- lw $t1, 1($0)
    		1 => X"8C090000",
		-- lw $t2, 1($0)
		2 => X"8C0A0001",
		
		-- $t1 = $t2 != $t0

		-- beq $t2, $t0,pos1
		3 => X"11480001",
		
		-- bne $t1,$t1, pos1
		4 => X"15290000",
		
		-- pos1: beq $t1,$t1,final
		5 => X"11290000", 
		
		-- final: bne $t2,$t0,inicio
		6 => X"1548FFF9",

		others => (others => 'U'));

begin

	process(clock)
		variable index: integer;
	begin
    if rising_edge(clock) then
      if enable='1' then
      		index := to_integer(unsigned(address_to_read));
			  instruction_out <= instructions(index);
			end if;
    end if;
	end process;

end behavioral;
