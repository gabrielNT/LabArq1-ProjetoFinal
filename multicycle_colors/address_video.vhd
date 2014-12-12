LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY address_video IS
	PORT(
    column       : IN  INTEGER;
    row          : IN  INTEGER;
    disp_ena     : IN  STD_LOGIC;
    video_out    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
    video_address: OUT STD_LOGIC_VECTOR(11 downto 0);
    VGA_R 	 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    VGA_G 	 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    VGA_B 	 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END address_video;

ARCHITECTURE behavior OF address_video IS

SIGNAL column_std: std_LOGIC_VECTOR(9 downto 0);
signal pixel: std_logic;
signal row_div4 : unsigned(11 downto 0);
signal pixel_r, pixel_g, pixel_b, pixel_s : std_logic;

BEGIN

  column_std <= std_logic_vector(to_unsigned(column, 10));
  row_div4 <= shift_right(to_unsigned(row, 12), 2); --divide os pixels para ficarem 4x4, um pixel representa 16
  video_address <= std_logic_vector(
              (shift_left(row_div4, 2)) --10 words*2columns = 640 bits (cada word com 32 bits)
            + (shift_left(row_div4, 0)) 
            + (shift_right(to_unsigned(column, 12), 7)));  --divide por 64 para caber na tela

  -- Criando pixel_r , pixel_g , pixel_b para selecionar as cores 
  -- para testar e ver as cores possiveis
  pixel_r <= video_out(31-to_integer(unsigned(column_std(5 downto 1)))*4);
  pixel_g <= video_out(30-to_integer(unsigned(column_std(5 downto 1)))*4);
  pixel_b <= video_out(29-to_integer(unsigned(column_std(5 downto 1)))*4);
  pixel_s <= video_out(28-to_integer(unsigned(column_std(5 downto 1)))*4);

  
  -- intensidade nas respectivas cores
  VGA_R(0) <= pixel_r when disp_ena='1' else '0'; 
  VGA_G(0) <= pixel_g when disp_ena='1' else '0';
  VGA_B(0) <= pixel_b when disp_ena='1' else '0';
  
  VGA_R(1) <= pixel_r when disp_ena='1' else '0'; 
  VGA_G(1) <= pixel_g when disp_ena='1' else '0';
  VGA_B(1) <= pixel_b when disp_ena='1' else '0';
 
  VGA_R(2) <= pixel_r when disp_ena='1' else '0'; 
  VGA_G(2) <= pixel_g when disp_ena='1' else '0';
  VGA_B(2) <= pixel_b when disp_ena='1' else '0'; 
  
  VGA_R(3) <= pixel_s when disp_ena='1' else '0'; 
  VGA_G(3) <= pixel_s when disp_ena='1' else '0';
  VGA_B(3) <= pixel_s when disp_ena='1' else '0';
 
  
END behavior;
