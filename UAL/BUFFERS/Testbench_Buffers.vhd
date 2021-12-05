-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

Entity BuffersTB is
end entity;
architecture Buffer of BufferTB_arch is

component BufferTP is

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
    
    end component;
begin

    Buffersundertest : BufferTP
    
    port map(
    clk : iMy_clk;
    reset : My_reset;
    Mem1_in : My_Mem1_in
    Mem1_out : My_Mem1_out 
    MEM1_val : My_MEM1_val
    
    Mem2_in : My_Mem2_in 
    Mem2_out : My_Mem2_out 
    Mem2_val : My_Mem2_val 
    
    SR_L_in : My_SR_L_in
    SR_L_out : My_SR_L_out 
    SR_L_val : My_SR_L_val 
    
    SR_R_in : My_SR_R_in
    SR_R_out : My_SR_R_out
    SR_L_val : My_SR_L_val
    
    BuffA_in : My_BuffA_in
    BuffA_out : My_BuffA_out
    BuffA_val : My_BuffA_val
    
    BuffB_in : My_BuffB_in
    BuffB_out : My_BuffB_out 
    BuffB_val :My_BuffB_val);
    
    MyStimulus_Proc : process
    begin
    for i in 0 to 1 loop
    	reset <= i
end process;
        
