library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MEM_instruction is
    Port ( clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		MEMinst_in : in STD_LOGIC_VECTOR (9 downto 0);
		MEMinst_out : out STD_LOGIC_VECTOR (9 downto 0);
		MEMinst_inst : in STD_logic_vector(3 downto 0);
		--INSTR_addr : in STD_LOGIC_VECTOR (6 downto 0);
		---INSTR_CE : in STD_LOGIC;
		--R1W0 : in STD_LOGIC);
end MEM_instruction;

architecture fonction of MEM_instruction

	Type data IS ARRAY (0 to 16) of std_logic_vector (9 downto 0);
	SIGNAL MEM_instBuff : data;
    
	signal My_MEMinst_in, My_MEMinst_out : in STD_LOGIC_VECTOR (9 downto 0);
	signal My_MEMinst_inst : in STD_LOGIC_VECTOR (9 downto 0);


begin

	MEM_instruction_proc : process (MEMinst_inst)
	  
	  
	case MEM_inst_inst is
	when "00":
		for i in 0 to 127 loop
		    MEM_instBuff(i) <= "0000000000";
		end loop;
	when"01":
		MEM_instBuff(0) <= "0000000000"; --| no op             | A -> Buf A    | 0     |
		MEM_instBuff(1) <= "1111011100"; --| A * B             | B -> Buf B    | 0     |
		MEM_instBuff(2) <= "0000111000"; --| no op             | S -> Mem 1    | 0     |
		MEM_instBuff(3) <= "0000000001"; --| no op             | A -> Buf A    | Mem 1 |
	when"10":
		MEM_instBuff(0) <= "0000000000"; --| no op             | A -> Buf A    | 0     |
		MEM_instBuff(1) <= "1101011100"; --| A add B           | B -> Buf B    | 0     |
		MEM_instBuff(2) <= "0111110000"; --| A xor S           | S -> Buf B    | 0     |
		MEM_instBuff(3) <= "0100110000"; --| not B (xnor)      | S -> Buf B    | 0     |
		MEM_instBuff(4) <= "0000111000"; --| no op             | S -> Mem 1    | 0     |
		MEM_instBuff(5) <= "0000000001"; --| no op             | A -> Buf A    | Mem 1 |
	when"11":
		MEM_instBuff(1) <= "0000000000"; --| no op             | A -> Buf A    | 0     | 
		MEM_instBuff(2) <= "1000011100"; --| déc droite A      | B -> Buf B    | 0     |
		MEM_instBuff(3) <= "0101010100"; --| A1 and B0         | S -> Buf A    | 0     |
		MEM_instBuff(4) <= "1010111000"; --| déc droite B      | S -> Mem 1    | 0     |
		MEM_instBuff(5) <= "0000110000"; --| no op             | S -> Buf B    | 0     |
		MEM_instBuff(6) <= "0101000000"; --| A0 and B1         | A -> Buf A    | 0     |
		MEM_instBuff(7) <= "0000110000"; --| no op             | S -> Buf B    | 0     |
		MEM_instBuff(8) <= "0110000100"; --| Buf A or Buf B    | Mem1 -> Buf A | 0     |
		MEM_instBuff(9) <= "0000111000"; --| no op             | S -> Mem 1    | 0     |
		MEM_instBuff(10) <= "0000000001"; --| no op             | A -> Buf A    | Mem1  |
        
    	end process;
    
end architecture;
