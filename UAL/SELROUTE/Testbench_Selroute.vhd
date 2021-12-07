library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity SELROUTEtestbench is 

end SELROUTEtestbench;

architecture SELROUTEtestbench_Arch of SELROUTEtestbench is

    component UAL_SELROUTE is
    Port ( 
            SEL_ROUTE, A, B : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (7 downto 0);
            BuffA_in, BuffB_in : out STD_LOGIC_VECTOR (3 downto 0);
            Mem_1_in, Mem_2_in : out STD_LOGIC_VECTOR (7 downto 0);
            Mem_1_out, Mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
            BuffA_val, BuffB_val : out STD_LOGIC;
            Mem1_val, Mem2_val  : out STD_LOGIC
            );
    end component;

    signal S_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal SEL_ROUTE_sim, A_sim, B_sim : STD_LOGIC_VECTOR (3 downto 0);
    signal BuffA_in_sim, BuffB_in_sim : STD_LOGIC_VECTOR (3 downto 0);
    signal Mem_1_in_sim, Mem_2_in_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal Mem_1_out_sim, Mem_2_out_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal BuffA_val_sim, BuffB_val_sim : STD_LOGIC;
    signal Mem1_val_sim, Mem2_val_sim : STD_LOGIC;
    
begin 

    MyComponentunderTest : UAL_SELROUTE
    port map (
        SEL_ROUTE => SEL_ROUTE_sim,
        BuffA_val => BuffA_val_sim,
        BuffB_val => BuffB_val_sim,
        Mem1_val => Mem1_val_sim,
        Mem2_val => Mem2_val_sim,
        S => S_sim,
        Mem_1_out => Mem_1_out_sim,
        Mem_2_out => Mem_2_out_sim,
        Mem_1_in => Mem_1_in_sim,
        Mem_2_in => Mem_2_in_sim,
        BuffA_in => BuffA_in_sim,
        BuffB_in => BuffB_in_sim,
        A => A_sim,
        B => B_sim
    );
    
    
    MyStimulus_Proc : process
    begin
        A_sim <= "1010";
        B_sim <= "1111";
        Mem_1_out_sim <= "00110111";
        Mem_2_out_sim <= "01110110";
        S_sim <= "11111000";
        
        for i in 0 to 15 loop
            SEL_ROUTE_sim <= std_logic_vector(to_unsigned(i,4));
            wait for 100 us;
            report std_logic'image(SEL_ROUTE_sim(3)) & std_logic'image(SEL_ROUTE_sim(2)) & std_logic'image(SEL_ROUTE_sim(1)) & std_logic'image(SEL_ROUTE_sim(0));
            
            report "BuffA_val : " & std_logic'image(BuffA_val_sim)&" ; BuffB_val : " & std_logic'image(BuffB_val_sim) & " ; Mem1_val : " & std_logic'image(Mem1_val_sim) & " ; Mem_2_out : " & std_logic'image(Mem2_val_sim);
            
            report "Buffer A IN : " & std_logic'image(BuffA_in_sim(3)) & std_logic'image(BuffA_in_sim(2)) & std_logic'image(BuffA_in_sim(1)) & std_logic'image(BuffA_in_sim(0));
            
            report "Buffer B IN : " & std_logic'image(BuffB_in_sim(3))&std_logic'image(BuffB_in_sim(2))&std_logic'image(BuffB_in_sim(1))&std_logic'image(BuffB_in_sim(0));
            
            report "Buffer Memory 1 : " & std_logic'image(Mem_1_in_sim(7)) & std_logic'image(Mem_1_in_sim(6)) & std_logic'image(Mem_1_in_sim(5)) & std_logic'image(Mem_1_in_sim(4)) & std_logic'image(Mem_1_in_sim(3)) & std_logic'image(Mem_1_in_sim(2)) & std_logic'image(Mem_1_in_sim(1)) & std_logic'image(Mem_1_in_sim(0));
            
            report "Buffer Memory 2 : " & std_logic'image(Mem_2_in_sim(7)) & std_logic'image(Mem_2_in_sim(6)) & std_logic'image(Mem_2_in_sim(5)) & std_logic'image(Mem_2_in_sim(4)) & std_logic'image(Mem_2_in_sim(3)) & std_logic'image(Mem_2_in_sim(2)) & std_logic'image(Mem_2_in_sim(1)) & std_logic'image(Mem_2_in_sim(0));
            
        end loop;
        report "Pas de Problème";
        wait;
    end process;

end SELROUTEtestbench_Arch;
