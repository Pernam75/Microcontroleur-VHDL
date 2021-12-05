library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity myBuffersUALtestbench is

end myBuffersUALtestbench;

architecture myBuffersUALtestbench_Arch of MyBuffersUALtestbench is

    component BuffersUAL is
        port (
            clock : in std_logic;
            reset : in std_logic;
            preset : in std_logic;
            
            Buffer_Memory1_IN : in std_logic_vector(7 downto 0);
            Buffer_Memory1_OUT : out std_logic_vector(7 downto 0);
            CE_Buffer_Memory1 : in std_logic;
            
            Buffer_Memory2_IN : in std_logic_vector(7 downto 0);
            Buffer_Memory2_OUT : out std_logic_vector(7 downto 0);
            CE_Buffer_Memory2 : in std_logic;
            
            Buffer_SR_IN_L_in : in std_logic;
            Buffer_SR_IN_L_OUT : out std_logic;
            CE_SR_IN_L : in std_logic;
            
            Buffer_SR_IN_R_in : in std_logic;
            Buffer_SR_IN_R_out : out std_logic;
            CE_SR_IN_R : in std_logic;
            
            Buffer_A_IN : in std_logic_vector(3 downto 0);
            Buffer_A_OUT : out std_logic_vector(3 downto 0);
            CE_Buffer_A : in std_logic;
            
            Buffer_B_IN : in std_logic_vector(3 downto 0);
            Buffer_B_OUT : out std_logic_vector(3 downto 0);
            CE_Buffer_B : in std_logic
            ;
            
            Buffer_SEL_FCT_IN : in STD_LOGIC_VECTOR (3 downto 0);
            Buffer_SEL_FCT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
            
            Buffer_SEL_OUT_IN : in STD_LOGIC_VECTOR (1 downto 0);
            Buffer_SEL_OUT_OUT : out STD_LOGIC_VECTOR (1 downto 0)
        );
        end component;

        constant PERIOD : time := 100us;

        signal reset_sim, preset_sim, clock_sim, CE_Buffer_A_sim, CE_Buffer_B_sim, CE_Buffer_Memory1_sim, CE_Buffer_Memory2_sim, CE_Buffer_SEL_OUT_sim, CE_Buffer_SEL_FCT_sim, Buffer_SR_IN_L_in_sim, Buffer_SR_IN_L_out_sim, CE_SR_IN_L_sim, Buffer_SR_IN_R_in_sim, Buffer_SR_IN_R_out_sim, CE_SR_IN_R_sim : STD_LOGIC;
        signal Buffer_SEL_FCT_IN_sim, Buffer_SEL_FCT_OUT_sim, Buffer_A_IN_sim, Buffer_A_OUT_sim, Buffer_B_IN_sim, Buffer_B_OUT_sim : STD_LOGIC_VECTOR (3 downto 0);
        signal Buffer_Memory1_IN_sim, Buffer_Memory1_OUT_sim, Buffer_Memory2_IN_sim, Buffer_Memory2_OUT_sim : STD_LOGIC_VECTOR (7 downto 0);
        signal Buffer_SEL_OUT_IN_sim Buffer_SEL_OUT_OUT_sim : STD_LOGIC_VECTOR (1 downto 0);
        
        port map (
            clock => clock_sim;
            reset => reset_sim;
            preset => preset_sim;
            
            Buffer_Memory1_IN => Buffer_Memory1_IN_sim;
            Buffer_Memory1_OUT => Buffer_Memory1_OUT_sim;
            CE_Buffer_Memory1 => CE_Buffer_Memory1_sim;
            
            Buffer_Memory2_IN => Buffer_Memory2_IN_sim;
            Buffer_Memory2_OUT => Buffer_Memory2_OUT_sim;
            CE_Buffer_Memory2 => CE_Buffer_Memory2_sim;
            
            Buffer_SR_IN_L_IN => Buffer_SR_IN_L_in_sim;
            Buffer_SR_IN_L_OUT => Buffer_SR_IN_L_OUT_sim;
            CE_SR_IN_L => CE_SR_IN_L_sim;
            
            Buffer_SR_IN_R_in => Buffer_SR_IN_R_in_sim;
            Buffer_SR_IN_R_out => Buffer_SR_IN_R_out_sim;
            CE_SR_IN_R => CE_SR_IN_R_sim;
            
            Buffer_A_IN => Buffer_A_IN_sim;
            Buffer_A_OUT => Buffer_A_OUT_sim;
            CE_Buffer_A => CE_Buffer_A_sim;
            
            Buffer_B_IN => Buffer_B_IN_sim;
            Buffer_B_OUT => Buffer_B_OUT_sim;
            CE_Buffer_B => CE_Buffer_B_sim;
            
            Buffer_SEL_FCT_IN => Buffer_SEL_FCT_IN_sim;
            Buffer_SEL_FCT_OUT => Buffer_SEL_FCT_OUT_sim;
            
            Buffer_SEL_OUT_IN => Buffer_SEL_OUT_IN_sim;
            Buffer_SEL_OUT_OUT => Buffer_SEL_OUT_OUT_sim;
        )
    My_clock_Proc : process -- pas de liste de sensibilité
    begin 
        clock_sim <= '0';
        wait for PERIOD/2;
        clock_sim <= '1';
        wait for PERIOD/2;
        if now = 20*PERIOD then 
            wait;
        end if;
    end process;

    MyBuffer_AProc : process
    begin
        reset_sim <= '1';
        preset_sim <= '0';
        Buffer_A_IN_sim <= (others => '0');
        Buffer_A_OUT <= (others => '0');
        wait for 3.25 * PERIOD;
        report " reset =" & std_logic'image(reset_sim) & " | preset = " & std_logic'image(preset_sim) & " | e1 = " & integer'image(to_integer(unsigned(Buffer_A_IN_sim))) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
        assert s1_sim = Buffer_A_OUT report "Failure" severity failure;

        reset_sim <= '0';
        preset_sim <= '1';
        Buffer_A_IN_sim <= (others => '0');
        Buffer_A_OUT <= (others => '1');
        wait for 3.5 * PERIOD;
        report " reset =" & std_logic'image(reset_sim) & " | preset = " & std_logic'image(preset_sim) & " | e1 = " & integer'image(to_integer(unsigned(Buffer_A_IN_sim))) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
        assert s1_sim = Buffer_A_OUT report "Failure" severity failure;

        reset_sim <= '0';
        preset_sim <= '0';
        for i in 0 to (2**N)-1 loop
            Buffer_A_IN_sim <= std_logic_vector(to_unsigned(i,N));
            wait for PERIOD;
            report "reset = " & std_logic'image(reset_sim) & " | preset =" & std_logic'image(preset_sim) & " | e1 = " & integer'image(i) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
        assert s1_sim = Buffer_A_IN_sim report "Failure" severity failure;
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;