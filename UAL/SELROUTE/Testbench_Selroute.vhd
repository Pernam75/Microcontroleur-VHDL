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
            buff_A_out, buff_B_out : out STD_LOGIC_VECTOR (3 downto 0);
            mem_1_in, mem_2_in : in STD_LOGIC_VECTOR (7 downto 0);
            mem_1_out, mem_2_out : out STD_LOGIC_VECTOR (7 downto 0);
            buff_A_in, buff_B_in : in STD_LOGIC_VECTOR (3 downto 0);
            BuffA_val, BuffB_val : out STD_LOGIC;
            Mem1_val, Mem2_val  : out STD_LOGIC
            );
    end component;

    signal S_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal SEL_ROUTE_sim, A_sim, B_sim : STD_LOGIC_VECTOR (3 downto 0);
    signal buff_A_out_sim, buff_B_out_sim, buff_A_in_sim, buff_B_in_sim : STD_LOGIC_VECTOR (3 downto 0);
    signal mem_1_in_sim, mem_2_in_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal mem_1_out_sim, mem_2_out_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal BuffA_val_sim, BuffB_val_sim : STD_LOGIC;
    signal mem1_val_sim, mem2_val_sim : STD_LOGIC;
    
begin 
    MyComponentSELROUTEunderTest : UAL_SELROUTE
    port map (
        SEL_ROUTE => SEL_ROUTE_sim,
        BuffA_val => BuffA_val_sim,
        BuffB_val => BuffB_val_sim,
        mem1_val => mem1_val_sim,
        mem2_val => mem2_val_sim,
        S => S_sim,
        mem_1_out => mem_1_out_sim,
        mem_2_out => mem_2_out_sim,
        mem_1_in => mem_1_in_sim,
        mem_2_in => mem_2_in_sim,
        buff_A_out => buff_A_out_sim,
        buff_B_out => buff_B_out_sim,
        buff_A_in => buff_A_in_sim,
        buff_B_in => buff_B_in_sim,
        A => A_sim,
        B => B_sim
    );
    
    
    MyStimulus_Proc : process
    begin
    	A_sim <= "1010";
        B_sim <= "1111";
        mem_1_in_sim <= "00110111";
        mem_2_in_sim <= "01110110";
        S_sim <= "11111000";
        for i in 0 to 15 loop
        	SEL_ROUTE_sim <= std_logic_vector(to_unsigned(i,4));
            wait for 100 us;
            report std_logic'image(SEL_ROUTE_sim(3)) & std_logic'image(SEL_ROUTE_sim(2)) & std_logic'image(SEL_ROUTE_sim(1)) & std_logic'image(SEL_ROUTE_sim(0));
            report "BuffA_val : " & std_logic'image(BuffA_val_sim)&" ; BuffB_val : " & std_logic'image(BuffB_val_sim) & " ; mem1_val : " & std_logic'image(mem1_val_sim) & " ; mem_2_out : " & std_logic'image(mem2_val_sim);
            report "Buffer A OUT : " & std_logic'image(buff_A_out_sim(3)) & std_logic'image(buff_A_out_sim(2)) & std_logic'image(buff_A_out_sim(1)) & std_logic'image(buff_A_out_sim(0));
            report "Buffer B OUT : " & std_logic'image(buff_B_out_sim(3))&std_logic'image(buff_B_out_sim(2))&std_logic'image(buff_B_out_sim(1))&std_logic'image(buff_B_out_sim(0));
            report "Buffer Memory 1 : " & std_logic'image(mem_1_out_sim(7)) & std_logic'image(mem_1_out_sim(6)) & std_logic'image(mem_1_out_sim(5)) & std_logic'image(mem_1_out_sim(4)) & std_logic'image(mem_1_out_sim(3)) & std_logic'image(mem_1_out_sim(2)) & std_logic'image(mem_1_out_sim(1)) & std_logic'image(mem_1_out_sim(0));
            report "Buffer Memory 2 : " & std_logic'image(mem_2_out_sim(7)) & std_logic'image(mem_2_out_sim(6)) & std_logic'image(mem_2_out_sim(5)) & std_logic'image(mem_2_out_sim(4)) & std_logic'image(mem_2_out_sim(3)) & std_logic'image(mem_2_out_sim(2)) & std_logic'image(mem_2_out_sim(1)) & std_logic'image(mem_2_out_sim(0));
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;

end SELROUTEtestbench_Arch;
