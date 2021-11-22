-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity Buffers is

port (
	clk : in std_logic;
    reset : in std_logic;
	Mem1_in : in std_logic_vector(7 downto 0);
    Mem1_out : out std_logic_vector(7 downto 0);
    MEM1_val : in std_logic;
    
    Mem2_in : in std_logic_vector(7 downto 0);
    Mem2_out : out std_logic_vector(7 downto 0);
    Mem2_val : in std_logic;
    
    SR_L_in : in std_logic;
    SR_L_out : out std_logic;
    SR_L_val : in std_logic;
    
    SR_R_in : in std_logic;
    SR_R_out : out std_logic;
    SR_L_val : in std_logic;
    
    BuffA_in : in std_logic_vector(3 downto 0);
    BuffA_out : out std_logic_vector(3 downto 0);
    BuffA_val : in std_logic;
    
    BuffB_in : in std_logic_vector(3 downto 0);
    BuffB_out : out std_logic_vector(3 downto 0);
    BuffB_val : in std_logic);
    
    end Buffers;
architecture Buffers_arch of Buffers is
begin
	BuffA_process : process (reset,clk,BuffA_val)
    begin 
 		if (reset ='1') then
        	BuffA_out <= (other => '0');
        elsif (rising_edge (clk) and BuffA_val ='0') then
        	BuffA_out <= BuffA_in;
    	end if;
    end process;
    
    
    BuffB_process : process (reset,clk,BuffB_val)
    begin 
 		if reset ='1' then
        	BuffB_out <= (other => '0');
        elsif (rising_edge (clk) and BuffB_val ='0') then
        	BuffB_out <= BuffB_in;
    	end if;
    end process;
    
    MEM1_process : process (reset,clk,MEM1_val)
    begin 
 		if reset ='1' then
        	MEM1_out <= (other => '0');
        elsif (rising_edge(clk) and MEM1_val ='0') then
        	MEM1_out <= MEM1_in;
    	end if;
    end process;
    
    MEM2_process : process (reset,clk,MEM2_val)
    begin 
 		if reset ='1' then
        	MEM2_out <= (other => '0');
        elsif (rising_edge(clk) and MEM2_val ='0') then
        	MEM2_out <= MEM2_in;
    	end if;
    end process;
    
    SR_L_process : process (reset,clk,SR_L_val)
    begin 
 		if reset ='1' then
        	SR_L_out <= (other => '0');
        elsif (rising_edge(clk) and SR_L_val ='0') then
        	SR_L_out <= SR_L_in;
    	end if;
    end process;
    
    SR_R_process : process (reset,clk,SR_R_val)
    begin 
 		if reset ='1' then
        	SR_R_out <= (other => '0');
        elsif (rising_edge(clk) and SR_R_val ='0') then
        	SR_R_out <= SR_R_in;
    	end if;
    end process;
        
end architecture;
