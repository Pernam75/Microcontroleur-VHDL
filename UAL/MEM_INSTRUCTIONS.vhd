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
           MEMinst_val: in std_logic;

end MEM_instruction;

architecture fonction of MEM_instruction

Type data IS ARRAY (0 to 16) of std_logic_vector (9 downto 0);
    SIGNAL MEM_instBuff : data;
    
signal My_MEMinst_in, My_MEMinst_out : in STD_LOGIC_VECTOR (9 downto 0);
signal  My_MEMinst_inst : in STD_LOGIC_VECTOR (9 downto 0);


begin
	MEM_instruction_proc : process (MEMinst_inst)
    
    if (reset = '0') then
     for i in 0 to 20 loop
                MEM_instBuff(i) <= "0000000000";
           end loop;
    
    case MEM_inst_inst is
	 when"01": --(A mult B)
       if (rising edge(clock) and MEMinst_val ='1') then 
          MEM_instBuff(0) <= "0000000000"; 
          MEM_instBuff(1) <= "1111011100"; 
          MEM_instBuff(2) <= "0000111000"; 
          MEM_instBuff(3) <= "0000000001"; 
     when"10": --(A add B) xnor A
       if (rising edge(clock) and MEMinst_val ='1') then 
          MEM_instBuff(0) <= "0000000000"; 
          MEM_instBuff(1) <= "1101011100"; 
          MEM_instBuff(2) <= "0111110000";
          MEM_instBuff(3) <= "0100110000"; 
          MEM_instBuff(4) <= "0000111000";
          MEM_instBuff(5) <= "0000000001"; 
     when"11": -- (A0 and B1) or (A1 and B0)
       if (rising edge(clock) and MEMinst_val ='1')then
          MEM_instBuff(1) <= "0000000000";
          MEM_instBuff(2) <= "1000011100"; 
          MEM_instBuff(3) <= "0101010100"; 
          MEM_instBuff(4) <= "1010111000";
          MEM_instBuff(5) <= "0000110000"; 
          MEM_instBuff(6) <= "0101000000"; 
          MEM_instBuff(7) <= "0000110000"; 
          MEM_instBuff(8) <= "0110000100"; 
          MEM_instBuff(9) <= "0000111000"; 
          MEM_instBuff(10) <= "0000000001";
      when others:
        for i in 0 to 20 loop
                  MEM_instBuff(i) <= "0000000000";
             end loop;   
      end process;
end architecture;
     
     
     
    
    




