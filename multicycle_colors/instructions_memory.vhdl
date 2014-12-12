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

		-- Inicio do programa , nessa parte vamos copiar o conteudo de memoria de uma linha e colar nas linhas abaixo ,
		-- desse modo desenharemos 16 quadrados cada um com uma cor diferente.

		-- begin : lw $t0, 0
		0 => X"8C080000",
		--lw $t1, 150($0)
		1 => X"8c090096",
		--lw $t2, 300($0)
		2 => X"8c0a012c",
		--lw $t3, 450($0)
		3 => X"8c0b01c2",
		--addi $a0, $0, 5
		4 => X"20040005",
		--addi $a1, $0, 155
		5 => X"2005009b",
		--addi $a2, $0, 305
		6 => X"20060131",
		--addi $a3, $0, 455
		7 => X"200701c7",
		--addi $v0, $0, 150
		8 => X"20020096",
		--loop1:  sw $t0, 0($a0)
		9 => X"ac880000",
		--sw $t1, 0($a1)
		10 => X"aca90000",
		--sw $t2, 0($a2)
		11 => X"acca0000",
		--sw $t3, 0($a3)
		12 => X"aceb0000",
		--addi $a0, $a0, 5
		13 => X"20840005",
		--addi $a1, $a1, 5
		14 => X"20a50005",
		--addi $a2, $a2, 5
		15 => X"20c60005",
		--addi $a3, $a3, 5
		16 => X"20e70005",
		--bne $a0, $v0, loop1 # Fim do primeiro loop
		17 => X"1482fff7",
		--lw $t0, 1($0)
		18 => X"8c080001",
		--lw $t1, 201($0)
		19 => X"8c0900c9",
		--lw $t2, 401($0)
		20 => X"8c0a0191",
		--addi $a0, $0, 6
		21 => X"20040006",
		--addi $a1, $0, 206
		22 => X"200500ce",
		--addi $a2, $0, 406
		23 => X"20060196",
		--addi $v0, $0, 201
		24 => X"200200c9",
		--loop2:  sw $t0, 0($a0)
		25 => X"ac880000",
		--sw $t1, 0($a1)
		26 => X"aca90000",
		--sw $t2, 0($a2)
		27 => X"acca0000",
		--addi $a0, $a0, 5
		28 => X"20840005",
		--addi $a1, $a1, 5
		29 => X"20a50005",
		--addi $a2, $a2, 5
		30 => X"20c60005",
		-- bne $a0, $v0, loop2
		31 => X"1482fff9",
		--lw $t0, 2($0)
		32 => X"8c080002",
		--lw $t1, 202($0)
		33 => X"8c0900ca",
		--lw $t2, 402($0)
		34 => X"8c0a0192",
		--addi $a0, $0, 7
		35 => X"20040007",
		--addi $a1, $0, 207
		36 => X"200500cf",
		--addi $a2, $0, 407
		37 => X"20060197",
		--addi $v0, $0, 202
		38 => X"200200ca",
		-- loop3:  sw $t0, 0($a0)
		39 => X"ac880000",
		--sw $t1, 0($a1)
		40 => X"aca90000",
		--sw $t2, 0($a2)
		41 => X"acca0000",
		--addi $a0, $a0, 5
		42 => X"20840005",
		--addi $a1, $a1, 5
		43 => X"20a50005",
		--addi $a2, $a2, 5
		44 => X"20c60005",
		--bne $a0, $v0, loop3 
		45 => X"1482fff9",
		--lw $t0, 3($0) 
		46 => X"8c080003",
		--lw $t1, 203($0)
		47 => X"8c0900cb",
		--lw $t2, 403($0)
		48 => X"8c0a0193",
		--addi $a0, $0, 8
		49 => X"20040008",
		--addi $a1, $0, 208
		50 => X"200500d0",
		--addi $a2, $0, 408
		51 => X"20060198",
		--addi $v0, $0, 203
		52 => X"200200cb",
		--loop4:  sw $t0, 0($a0)
		53 => X"ac880000",
		--sw $t1, 0($a1)
		54 => X"aca90000",
		--sw $t2, 0($a2)
		55 => X"acca0000",
		--addi $a0, $a0, 5
		56 => X"20840005",
		--addi $a1, $a1, 5
		57 => X"20a50005",
		--addi $a2, $a2, 5
		58 => X"20c60005",
		--bne $a0, $v0, loop4 
		59 => X"1482fff9",
		--lw $t0, 4($0) 
		60 => X"8c080004",
		--lw $t1, 204($0)
		61 => X"8c0900cc",
		--lw $t2, 404($0)
		62 => X"8c0a0194",
		--addi $a0, $0, 9
		63 => X"20040009",
		--addi $a1, $0, 209
		64 => X"200500d1",
		--addi $a2, $0, 409
		65 => X"20060199",
		--addi $v0, $0, 204
		66 => X"200200cc",
		--loop5:  sw $t0, 0($a0)
		67 => X"ac880000",
		--sw $t1, 0($a1)
		68 => X"aca90000",
		--sw $t2, 0($a2)
		69 => X"acca0000",
		--addi $a0, $a0, 5
		70 => X"20840005",
		--addi $a1, $a1, 5
		71 => X"20a50005",
		--addi $a2, $a2, 5
		72 => X"20c60005",
		--bne $a0, $v0, loop5 
    73 => X"1482fff9",


		-- Aqui criaremos varios loops para atrasar o tempo de resposta do processador , 
		-- caso contrario a troca de cores ficara muito rapida.


		
		--addi $k1,$0, 3000
		74 => X"201b7530",
		--addi $k0, $0, 1
		75 => X"201a0001",
		-- cor:    addi $k0, $k0, 1
		76 => X"235a0001",
		--bne $k0, $k1, cor
		77 => X"175bfffe",
		--addi $k1,$0, 3000
		78 => X"201b7530",
		--addi $k0, $0, 1
		79 => X"201a0001",
		-- cor1:    addi $k0, $k0, 1
		80 => X"235a0001",
		--bne $k0, $k1, cor1
		81 => X"175bfffe",
		--addi $k1,$0, 3000
		82 => X"201b7530",
		--addi $k0, $0, 1
		83 => X"201a0001",
		-- cor2:    addi $k0, $k0, 1
		84 => X"235a0001",
		--bne $k0, $k1, cor2
		85 => X"175bfffe",
		--addi $k1,$0, 3000
		86 => X"201b7530",
		--addi $k0, $0, 1
		87 => X"201a0001",
		-- cor3:    addi $k0, $k0, 1
		88 => X"235a0001",
		--bne $k0, $k1, cor3
		89 => X"175bfffe",
		--addi $k1,$0, 3000
		90 => X"201b7530",
		--addi $k0, $0, 1
		91 => X"201a0001",
		-- cor4:    addi $k0, $k0, 1
		92 => X"235a0001",
		--bne $k0, $k1, cor4
		93 => X"175bfffe",
		--addi $k1,$0, 3000
		94 => X"201b7530",
		--addi $k0, $0, 1
		95 => X"201a0001",
		-- cor5:    addi $k0, $k0, 1
		96 => X"235a0001",
		--bne $k0, $k1, cor5
		97 => X"175bfffe",
		--addi $k1,$0, 3000
		98 => X"201b7530",
		--addi $k0, $0, 1
		99 => X"201a0001",
		-- cor6:    addi $k0, $k0, 1
		100 => X"235a0001",
		--bne $k0, $k1, cor6
		101 => X"175bfffe",
		--addi $k1,$0, 3000
		102 => X"201b7530",
		--addi $k0, $0, 1
		103 => X"201a0001",
		-- cor7:    addi $k0, $k0, 1
		104 => X"235a0001",
		--bne $k0, $k1, cor7
		105 => X"175bfffe",
		--addi $k1,$0, 3000
		106 => X"201b7530",
		--addi $k0, $0, 1
		107 => X"201a0001",
		-- cor8:    addi $k0, $k0, 1
		108 => X"235a0001",
		--bne $k0, $k1, cor8
		109 => X"175bfffe",
		--addi $k1,$0, 3000
		110 => X"201b7530",
		--addi $k0, $0, 1
		111 => X"201a0001",
		-- cor9:    addi $k0, $k0, 1
		112 => X"235a0001",
		--bne $k0, $k1, cor9
		113 => X"175bfffe",
		--addi $k1,$0, 3000
		114 => X"201b7530",
		--addi $k0, $0, 1
		115 => X"201a0001",
		-- cor10:    addi $k0, $k0, 1
		116 => X"235a0001",
		--bne $k0, $k1, cor10
		117 => X"175bfffe",
		--addi $k1,$0, 3000
		118 => X"201b7530",
		--addi $k0, $0, 1
		119 => X"201a0001",
		-- cor11:    addi $k0, $k0, 1
		120 => X"235a0001",
		--bne $k0, $k1, cor11
		121 => X"175bfffe",
		--addi $k1,$0, 3000
		122 => X"201b7530",
		--addi $k0, $0, 1
		123 => X"201a0001",
		-- cor12:    addi $k0, $k0, 1
		124 => X"235a0001",
		--bne $k0, $k1, cor12
		125 => X"175bfffe",
		--addi $k1,$0, 3000
		126 => X"201b7530",
		--addi $k0, $0, 1
		127 => X"201a0001",
		-- cor13:    addi $k0, $k0, 1
		128 => X"235a0001",
		--bne $k0, $k1, cor13
		129 => X"175bfffe",
		--addi $k1,$0, 3000
		130 => X"201b7530",
		--addi $k0, $0, 1
		131 => X"201a0001",
		-- cor14:    addi $k0, $k0, 1
		132 => X"235a0001",
		--bne $k0, $k1, cor14
		133 => X"175bfffe",
		--addi $k1,$0, 3000
		134 => X"201b7530",
		--addi $k0, $0, 1
		135 => X"201a0001",
		-- cor15:    addi $k0, $k0, 1
		136 => X"235a0001",
		--bne $k0, $k1, cor15
		137 => X"175bfffe",
		--addi $k1,$0, 3000
		138 => X"201b7530",
		--addi $k0, $0, 1
		139 => X"201a0001",
		-- cor16:    addi $k0, $k0, 1
		140 => X"235a0001",
		--bne $k0, $k1, cor16
		141 => X"175bfffe",
		--addi $k1,$0, 3000
		142 => X"201b7530",
		--addi $k0, $0, 1
		143 => X"201a0001",
		-- cor17:    addi $k0, $k0, 1
		144 => X"235a0001",
		--bne $k0, $k1, cor17
		145 => X"175bfffe",
		--addi $k1,$0, 3000
		146 => X"201b7530",
		--addi $k0, $0, 1
		147 => X"201a0001",
		-- cor18:    addi $k0, $k0, 1
		148 => X"235a0001",
		--bne $k0, $k1, cor18
		149 => X"175bfffe",
		--addi $k1,$0, 3000
		150 => X"201b7530",
		--addi $k0, $0, 1
		151 => X"201a0001",
		-- cor19:    addi $k0, $k0, 1
		152 => X"235a0001",
		--bne $k0, $k1, cor19
		153 => X"175bfffe",
		--addi $k1,$0, 3000
		154 => X"201b7530",
		--addi $k0, $0, 1
		155 => X"201a0001",
		-- cor20:    addi $k0, $k0, 1
		156 => X"235a0001",
		--bne $k0, $k1, cor20
		157 => X"175bfffe",
		--addi $k1,$0, 3000
		158 => X"201b7530",
		--addi $k0, $0, 1
		159 => X"201a0001",
		-- cor21:    addi $k0, $k0, 1
		160 => X"235a0001",
		--bne $k0, $k1, cor21
		161 => X"175bfffe",
		--addi $k1,$0, 3000
		162 => X"201b7530",
		--addi $k0, $0, 1
		163 => X"201a0001",
		-- cor22:    addi $k0, $k0, 1
		164 => X"235a0001",
		--bne $k0, $k1, cor22
		165 => X"175bfffe",
		--addi $k1,$0, 3000
		166 => X"201b7530",
		--addi $k0, $0, 1
		167 => X"201a0001",
		-- cor23:    addi $k0, $k0, 1
		168 => X"235a0001",
		--bne $k0, $k1, cor23
		169 => X"175bfffe",
		--addi $k1,$0, 3000
		170 => X"201b7530",
		--addi $k0, $0, 1
		171 => X"201a0001",
		-- cor24:    addi $k0, $k0, 1
		172 => X"235a0001",
		--bne $k0, $k1, cor24
		173 => X"175bfffe",
		--addi $k1,$0, 3000
		174 => X"201b7530",
		--addi $k0, $0, 1
		175 => X"201a0001",
		-- cor25:    addi $k0, $k0, 1
		176 => X"235a0001",
		--bne $k0, $k1, cor25
		177 => X"175bfffe",
		--addi $k1,$0, 3000
		178 => X"201b7530",
		--addi $k0, $0, 1
		179 => X"201a0001",
		-- cor26:    addi $k0, $k0, 1
		180 => X"235a0001",
		--bne $k0, $k1, cor26
		181 => X"175bfffe",
		--addi $k1,$0, 3000
		182 => X"201b7530",
		--addi $k0, $0, 1
		183 => X"201a0001",
		-- cor27:    addi $k0, $k0, 1
		184 => X"235a0001",
		--bne $k0, $k1, cor27
		185 => X"175bfffe",
		--addi $k1,$0, 3000
		186 => X"201b7530",
		--addi $k0, $0, 1
		187 => X"201a0001",
		-- cor28:    addi $k0, $k0, 1
		188 => X"235a0001",
		--bne $k0, $k1, cor28


		-- Agora iremos mudar a posição de memoria das cores , fazendo os blocos "andarem" na tela.


		189 => X"175bfffe",
		--lw $t0, 1($0)
		190 => X"8c080001",
		--lw $t1, 201($0)
		191 => X"8c0900c9",
		--lw $t2, 401($0)
		192 => X"8c0a0191",
		--sw $t0,201($0)
		193 => X"ac0800c9",
		--sw $t1,401($0)
		194 => X"ac090191",
		--sw $t2,1($0)
		195 => X"ac0a0001",
		--lw $t0, 2($0)
		196 => X"8c080002",
		--lw $t1, 202($0)
		197 => X"8c0900ca",
		--lw $t2, 402($0)
		198 => X"8c0a0192",
		--sw $t0,202($0)
		199 => X"ac0800ca",
		--sw $t1,402($0)
		200 => X"ac090192",
		--sw $t2,2($0)
		201 => X"ac0a0002",
		--lw $t0,3($0)
		202 => X"8c080003",
		--lw $t1,203($0)
		203 => X"8c0900cb",
		--lw $t2,403($0)
		204 => X"8c0a0193",
		--sw $t0,403($0)
		205 => X"ac080193",
		--sw $t1,3($0)
		206 => X"ac090003",
		--sw $t2,203($0)
		207 => X"ac0a00cb",
		--lw $t0,4($0)
		208 => X"8c080004",
		--lw $t1,204($0)
		209 => X"8c0900cc",
		--lw $t2,404($0)
		210 => X"8c0a0194",
		--sw $t0,404($0)
		211 => X"ac080194",
		--sw $t1,4($0)
		212 => X"ac090004",
		--sw $t2,204($0
		213 => X"ac0a00cc",
		--j begin
		214 => X"08100000",
		
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
