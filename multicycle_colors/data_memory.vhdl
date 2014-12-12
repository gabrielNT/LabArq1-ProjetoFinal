library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity data_memory is
	generic (
		address_width: integer := 12;
		data_width: integer := 32);

	port (
    clock: std_logic;
		address_to_read, address_to_write, video_address: in std_logic_vector (address_width - 1 downto 0);
		data_to_write: in std_logic_vector (data_width - 1 downto 0);
		read, write: in std_logic;
		data_out, video_out: out std_logic_vector (data_width - 1 downto 0));
end data_memory;

architecture behavioral of data_memory is

	type data_sequence is array (0 to 2**address_width - 1) of std_logic_vector (data_width - 1 downto 0);  
-- ModelSim
	signal data: data_sequence := (
     0 =>"00000000000000000000000000000000", -- Preto
 	  1 => "11011101110111011101110111011101", -- Amarelo Alt
 	  2 =>"11001100110011001100110011001100", -- Amarelo 
 	  3 => "01010101010101010101010101010101", -- Verde Alt
 	  4 => "01000100010001000100010001000100", -- Verde  
	  150 => "11101110111011101110111011101110", -- Branco 
	  201 => "10011001100110011001100110011001", -- Vermelho Alt	
	  202 => "10001000100010001000100010001000", -- Vermelho 	
	  203 => "01110111011101110111011101110111", -- Ciano Alt
	  204 => "01100110011001100110011001100110", -- Ciano
	  300 => "00010001000100010001000100010001", -- Preto Alt  
	  401 => "10111011101110111011101110111011", -- Rosa Alt 
	  402 => "10101010101010101010101010101010", -- Rosa
	  403 => "00110011001100110011001100110011", -- Azul Alt
	  404 => "00100010001000100010001000100010", -- Azul 
	  450 => "11111111111111111111111111111111", -- Branco Alt
	 
	 others => (others => 'U'));
-- Quartus II
--	signal data: data_sequence;

begin

 
  
  
   process(clock)
		variable index: integer;
   begin
   if(rising_edge(clock)) then -- Port A
    			index := to_integer(unsigned(address_to_write));
       if(write = '1') then
   	    		data(index) <= data_to_write;
          -- Read-during-write on the same port returns NEW data
          data_out <= data_to_write;
       else
          -- Read-during-write on the mixed port returns OLD data
          data_out <= data(index);
       end if;
   end if;
   end process;
   
   
 	read_video: process (clock)
		variable index: integer;
	begin
   if(rising_edge(clock)) then -- Port B
			index := to_integer(unsigned(video_address));
			video_out <= data(index);
   end if;
	end process;


end behavioral;

