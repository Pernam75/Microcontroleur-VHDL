library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity Buffers is

port (
    clk : in std_logic;
    reset : in std_logic;
    preset : in std_logic;
    
    mem1_in : in std_logic_vector(7 downto 0);
    mem1_out : out std_logic_vector(7 downto 0);
    mem1_val : in std_logic;
    
    mem2_in : in std_logic_vector(7 downto 0);
    mem2_out : out std_logic_vector(7 downto 0);
    mem2_val : in std_logic;
    
    SR_L_in : in std_logic;
    SR_L_out : out std_logic;
    SR_L_val : in std_logic;
    
    SR_R_in : in std_logic;
    SR_R_out : out std_logic;
    SR_R_val : in std_logic;
    
    BuffA_in : in std_logic_vector(3 downto 0);
    BuffA_out : out std_logic_vector(3 downto 0);
    BuffA_val : in std_logic;
    
    BuffB_in : in std_logic_vector(3 downto 0);
    BuffB_out : out std_logic_vector(3 downto 0);
    BuffB_val : in std_logic;
    
    Buff_SEL_FCT_in : in STD_LOGIC_VECTOR (3 downto 0);
    Buff_SEL_FCT_out : out STD_LOGIC_VECTOR (3 downto 0);
    
    Buff_SEL_OUT_in : in STD_LOGIC_VECTOR (1 downto 0);
    Buff_SEL_OUT_out : out STD_LOGIC_VECTOR (1 downto 0));
    
    end Buffers;
    
    
architecture Buffers_arch of Buffers is
begin
	BuffA_process : process (reset,clk,BuffA_val)
    begin 
 		if (reset ='1') then
        	BuffA_out <= (others => '0');
        elsif (rising_edge(clk) and BuffA_val ='1') then
        	BuffA_out <= BuffA_in;
    	end if;
    end process;
    
    
    BuffB_process : process (reset,clk,BuffB_val)
    begin 
 		if reset ='1' then
        	BuffB_out <= (others => '0');
        elsif (rising_edge(clk) and BuffB_val ='1') then
        	BuffB_out <= BuffB_in;
    	end if;
    end process;
    
    mem1_process : process (reset,clk,mem1_val)
    begin 
 		if reset ='1' then
        	mem1_out <= (others => '0');
        elsif (rising_edge(clk) and mem1_val ='1') then
        	mem1_out <= mem1_in;
    	end if;
    end process;
    
    mem2_process : process (reset,clk,mem2_val)
    begin 
 		if reset ='1' then
        	mem2_out <= (others => '0');
        elsif (rising_edge(clk) and mem2_val ='1') then
        	mem2_out <= mem2_in;
    	end if;
    end process;
    
    SR_L_process : process (reset,clk,SR_L_val)
    begin 
 		if reset ='1' then
        	SR_L_out <= '0';
        elsif (rising_edge(clk) and SR_L_val ='1') then
        	SR_L_out <= SR_L_in;
    	end if;
    end process;
    
    SR_R_process : process (reset,clk,SR_R_val)
    begin 
 		if reset ='1' then
        	SR_R_out <= '0';
        elsif (rising_edge(clk) and SR_R_val ='1') then
        	SR_R_out <= SR_R_in;
    	end if;
    end process;
    
    Buff_SEL_FCT_process : process (reset, clk)
    begin
        if reset = '1' then
            Buff_SEL_FCT_out <= (others => '0'); 
        elsif (rising_edge(clk)) then
            Buff_SEL_FCT_out <= Buff_SEL_FCT_in;
        end if;
    end process;
    
        Buff_SEL_OUT_process : process (reset, clk)
    begin
        if reset = '1' then
            Buff_SEL_OUT_out <= (others => '0'); 
        elsif (rising_edge(clk)) then
            Buff_SEL_OUT_out <= Buff_SEL_OUT_In;
        end if;
    end process;
        
end architecture;
