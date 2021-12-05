library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity my_UAL_SELOUT_testbench is

end my_UAL_SELOUT_testbench;

architecture my_UAL_SELOUT_testbench_Arch of my_UAL_SELOUT_testbench is
    component UAL_SELOUT is
    Port ( 
        S, MEM_CACHE_1, MEM_CACHE_2 : in STD_LOGIC_VECTOR (7 downto 0);
        SEL_OUT : in STD_LOGIC_VECTOR (1 downto 0);
        RES_OUT : out STD_LOGIC_VECTOR (7 downto 0)
    );
    end component;
    
    signal S_sim, MEM_CACHE_1_sim, MEM_CACHE_2_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal SEL_OUT_sim : STD_LOGIC_VECTOR (1 downto 0);
    signal RES_OUT_sim : STD_LOGIC_VECTOR(7 downto 0);

begin
    MyComponentunderTest : UAL_SELOUT
    port map (
        SEL_OUT => SEL_OUT_sim,
        MEM_CACHE_1 => MEM_CACHE_1_sim,
        MEM_CACHE_2 => MEM_CACHE_2_sim,
        S => S_sim,
        RES_OUT => RES_OUT_sim
    );

    MyStimulus_Proc : process
    begin
        MEM_CACHE_1_sim <= "00000101";
        MEM_CACHE_2_sim <= "11111111";
        S_sim <= "00000001";
        SEL_OUT_sim <= "01";
        for i in 0 to 3 loop
            SEL_OUT_sim <= std_logic_vector(to_unsigned(i,2));
            wait for 100 us;
            report std_logic'image(SEL_OUT_sim(1)) & std_logic'image(SEL_OUT_sim(0));
            report "RES OUT : " & std_logic'image(RES_OUT_sim(7)) & std_logic'image(RES_OUT_sim(6)) & std_logic'image(RES_OUT_sim(5)) & std_logic'image(RES_OUT_sim(4)) & std_logic'image(REs_OUT_sim(3)) & std_logic'image(RES_OUT_sim(2)) & std_logic'image(RES_OUT_sim(1)) & std_logic'image(RES_OUT_sim(0));
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;
end my_UAL_SELOUT_testbench_arch;
