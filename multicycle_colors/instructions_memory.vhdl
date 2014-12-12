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
	(
		0 => X"8C080000",
		1 => X"8c09001e",
		2 => X"8c0a003c",
		3 => X"8c0b005a",
		4 => X"20040005",
		5 => X"20050023",
		6 => X"20060041",
		7 => X"2007005f",
		8 => X"2002001e",
		9 => X"ac880000",
		10 => X"aca90000",
		11 => X"acca0000",
		12 => X"aceb0000",
		13 => X"20840005",
		14 => X"20a50005",
		15 => X"20c60005",
		16 => X"20e70005",
		17 => X"1482fff7",
		      
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
