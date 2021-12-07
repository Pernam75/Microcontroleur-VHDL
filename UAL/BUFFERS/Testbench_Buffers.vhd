library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity myBuffersUALtestbench is

end myBuffersUALtestbench;

architecture myBuffersUALtestbench_Arch of MyBuffersUALtestbench is

    component Buffers is
        port (
            clk : in std_logic;
            reset : in std_logic;
            
            Mem1_in : in std_logic_vector(7 downto 0);
            Mem1_out : out std_logic_vector(7 downto 0);
            Mem1_val : in std_logic;
            
            Mem2_in : in std_logic_vector(7 downto 0);
            Mem2_out : out std_logic_vector(7 downto 0);
            Mem2_val : in std_logic;
            
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
            Buff_SEL_OUT_out : out STD_LOGIC_VECTOR (1 downto 0)
        );
        end component;

        constant PERIOD : time := 100 us;

        signal reset_sim, clk_sim, BuffA_val_sim, BuffB_val_sim, Mem1_val_sim, Mem2_val_sim, SR_L_in_sim, SR_L_out_sim, SR_L_val_sim, SR_R_in_sim, SR_R_out_sim, SR_R_val_sim : STD_LOGIC;
        signal Buff_SEL_FCT_in_sim, Buff_SEL_FCT_out_sim, BuffA_in_sim, BuffA_out_sim, BuffB_in_sim, BuffB_out_sim : STD_LOGIC_VECTOR (3 downto 0);
        signal Mem1_in_sim, Mem1_out_sim, Mem2_in_sim, Mem2_out_sim : STD_LOGIC_VECTOR (7 downto 0);
        signal Buff_SEL_OUT_in_sim, Buff_SEL_OUT_out_sim : STD_LOGIC_VECTOR (1 downto 0);
        
        
begin 
    MyComponentBuffersUALunderTest : Buffers
        port map (
            clk => clk_sim,
            reset => reset_sim,
            
            Mem1_in => Mem1_in_sim,
            Mem1_out => Mem1_out_sim,
            Mem1_val => Mem1_val_sim,
            
            Mem2_in => Mem2_in_sim,
            Mem2_out => Mem2_out_sim,
            Mem2_val => Mem2_val_sim,
            
            SR_L_in => SR_L_in_sim,
            SR_L_out => SR_L_out_sim,
            SR_L_val => SR_L_val_sim,
            
            SR_R_in => SR_R_in_sim,
            SR_R_out => SR_R_out_sim,
            SR_R_val => SR_R_val_sim,
            
            BuffA_in => BuffA_in_sim,
            BuffA_out => BuffA_out_sim,
            BuffA_val => BuffA_val_sim,
            
            BuffB_in => BuffB_in_sim,
            BuffB_out => BuffB_out_sim,
            BuffB_val => BuffB_val_sim,
            
            Buff_SEL_FCT_in => Buff_SEL_FCT_in_sim,
            Buff_SEL_FCT_out => Buff_SEL_FCT_out_sim,
            
            Buff_SEL_OUT_in => Buff_SEL_OUT_in_sim,
            Buff_SEL_OUT_out => Buff_SEL_OUT_out_sim
        );
    My_clk_Proc : process
    begin 
        clk_sim <= '0';
        wait for PERIOD/2;
        clk_sim <= '1';
        wait for PERIOD/2;
        if now = 500*PERIOD then 
            wait;
        end if;
    end process;

    MyBufferA_Proc : process
    begin
    	BuffA_val_sim <= '1';
        BuffA_in_sim <= "0111";
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer A IN = " & integer'image(to_integer(unsigned(BuffA_in_sim))) & " || Buffer A OUT = " & integer'image(to_integer(unsigned(BuffA_out_sim)));
        
        reset_sim <= '0';
        for i in 0 to 15 loop
            BuffA_in_sim <= std_logic_vector(to_unsigned(i,4));
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) & " | Buffer A IN = " & integer'image(to_integer(unsigned(BuffA_in_sim))) & " || Buffer A OUT = " & integer'image(to_integer(unsigned(BuffA_out_sim)));
        end loop;
        report "Test BuffA Fini";
        wait;
    end process;
    
    MyBufferB_Proc : process
    begin
    	BuffB_val_sim <= '1';
        BuffB_in_sim <= "1010";
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer B IN = " & integer'image(to_integer(unsigned(BuffB_in_sim))) & " || Buffer B OUT = " & integer'image(to_integer(unsigned(BuffB_out_sim)));
        reset_sim <= '0';
        for i in 0 to 15 loop
            BuffB_in_sim <= std_logic_vector(to_unsigned(i,4));
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) & " | Buffer B IN = " & integer'image(to_integer(unsigned(BuffB_in_sim))) & " || Buffer B OUT = " & integer'image(to_integer(unsigned(BuffB_out_sim)));
        end loop;
        report "Test BuffB Fini";
        wait;
    end process;
    
    MyBufferMemory1_Proc : process
    begin
    	Mem1_val_sim <= '1';
        Mem1_in_sim <= "00000001";
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer Memory 1 IN = " & integer'image(to_integer(unsigned(Mem1_in_sim))) & " || Buffer Memory 1 OUT = " & integer'image(to_integer(unsigned(Mem1_out_sim)));
        reset_sim <= '0';
        for i in 0 to 255 loop
            Mem1_in_sim <= std_logic_vector(to_unsigned(i,8));
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) & " | Buffer Memory 1 IN = " & integer'image(to_integer(unsigned(Mem1_in_sim))) & " || Buffer Memory 1 OUT = " & integer'image(to_integer(unsigned(Mem1_out_sim)));
        end loop;
        report "Test Mem1 Fini";
        wait;
    end process;
    
    MyBufferMemory2_Proc : process
    begin
    	Mem2_val_sim <= '1';
        Mem2_in_sim <= "01101100";
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer Memory 2 IN = " & integer'image(to_integer(unsigned(Mem2_in_sim))) & " || Buffer Memory 2 OUT = " & integer'image(to_integer(unsigned(Mem2_out_sim)));
        reset_sim <= '0';
        for i in 0 to 255 loop
            Mem2_in_sim <= std_logic_vector(to_unsigned(i,8));
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) &  " | Buffer Memory 2 IN = " & integer'image(to_integer(unsigned(Mem2_in_sim))) & " || Buffer Memory 2 OUT = " & integer'image(to_integer(unsigned(Mem2_out_sim)));
        end loop;
        report "Test Mem2 Fini";
        wait;
    end process;
    
    MyBuffer_SR_IN_LProc : process
    begin
    	SR_L_val_sim <= '1';
        SR_L_in_sim <= '1';
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer SR IN L IN = " & std_logic'image(SR_L_in_sim) & " || Buffer SR IN L OUT = " & std_logic'image(SR_L_out_sim);
        SR_L_in_sim <= '0';
        reset_sim <= '0';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) &  " | Buffer SR IN L IN = " & std_logic'image(SR_L_in_sim) & " || Buffer SR IN L OUT = " & std_logic'image(SR_L_out_sim);
        reset_sim <= '0';
        for i in std_logic range  '0' to '1' loop
            SR_L_in_sim <= i;
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) &  " | Buffer SR IN L IN = " & std_logic'image(SR_L_in_sim) & " || Buffer SR IN L OUT = " & std_logic'image(SR_L_out_sim);
        end loop;
        report "Test SRinL Fini";
        wait;
    end process;
    
    MyBuffer_SR_IN_RProc : process
    begin
    	SR_R_val_sim <= '1';
        SR_R_in_sim <= '1';
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer SR IN R IN = " & std_logic'image(SR_R_in_sim) & " || Buffer SR IN R OUT = " & std_logic'image(SR_R_out_sim);
        SR_R_in_sim <= '0';
        reset_sim <= '0';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer SR IN R IN = " & std_logic'image(SR_R_in_sim) & " || Buffer SR IN R OUT = " & std_logic'image(SR_R_out_sim);
        reset_sim <= '0';
        for i in std_logic range '0' to '1' loop
            SR_R_in_sim <= i;
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) & " | Buffer SR IN R IN = " & std_logic'image(SR_R_in_sim) & " || Buffer SR IN R OUT = " & std_logic'image(SR_R_out_sim);
        end loop;
        report "Test SRinR Fini";
        wait;
    end process;
    
    MyBuffer_SEL_FCTProc : process
    begin
        Buff_SEL_FCT_in_sim <= "0110";
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer SEL FCT IN = " & integer'image(to_integer(unsigned(Buff_SEL_FCT_in_sim))) & " || Buffer SEL FCT OUT = " & integer'image(to_integer(unsigned(Buff_SEL_FCT_out_sim)));
        reset_sim <= '0';
        for i in 0 to 15 loop
            Buff_SEL_FCT_in_sim <= std_logic_vector(to_unsigned(i,4));
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) & " | Buffer SEL FCT IN = " & integer'image(to_integer(unsigned(Buff_SEL_FCT_in_sim))) & " || Buffer SEL FCT OUT = " & integer'image(to_integer(unsigned(Buff_SEL_FCT_out_sim)));
        end loop;
        report "Test SEL_FCT Fini";
        wait;
    end process;
    
    MyBuffer_SEL_OUTProc : process
    begin
        Buff_SEL_OUT_in_sim <= "11";
        reset_sim <= '1';
        wait for 3.5 * PERIOD;
        report " reset = " & std_logic'image(reset_sim) & " | Buffer SEL OUT IN = " & integer'image(to_integer(unsigned(Buff_SEL_OUT_in_sim))) & " || Buffer SEL OUT OUT = " & integer'image(to_integer(unsigned(Buff_SEL_OUT_out_sim)));
        reset_sim <= '0';
        for i in 0 to 3 loop
            Buff_SEL_OUT_in_sim <= std_logic_vector(to_unsigned(i,2));
            wait for PERIOD;
            report " reset = " & std_logic'image(reset_sim) & " | Buffer SEL OUT IN = " & integer'image(to_integer(unsigned(Buff_SEL_OUT_in_sim))) & " || Buffer SEL OUT OUT = " & integer'image(to_integer(unsigned(Buff_SEL_OUT_out_sim)));
        end loop;
        report "Test SEL_OUT Fini";
        wait;
    end process;    

end myBuffersUALtestbench_Arch;
