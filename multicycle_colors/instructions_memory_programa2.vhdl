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
							-- Carregando o valor da posição 0 e 1 da memoria em registradores

						  --lw $t0, 0($0)
							0 => X"8C080000",
          		-- lw $t1, 0($0)
    					1 => X"8C090000",
              -- lw $t2, 1($0)						
              2 => X"8C0A0001",

							-- Incrementa o registrador t0 e o insere no endereço de memoria t0

              -- add $t0, $t0, $t1
              3 => X"01094020",
              -- sw $t0, 0($t0)
              4 => X"AD080000",

							-- Volta para o começo

              --j 3
              5 => X"08000003",

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
