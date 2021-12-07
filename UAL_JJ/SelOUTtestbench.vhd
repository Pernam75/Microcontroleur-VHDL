library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity mySelOutUALtestbench is

end mySelOutUALtestbench;

architecture mySelOutUALtestbench_Arch of mySelOutUALtestbench is
    component SelOUTUAL is
    Port(
        SEL_OUT : in STD_LOGIC_VECTOR (1 downto 0);
        S, MEM_CACHE_1, MEM_CACHE_2 : in STD_LOGIC_VECTOR (7 downto 0);
        RES_OUT : out STD_LOGIC_VECTOR(7 downto 0)        
    );
    end component;

    signal SEL_OUT_sim : STD_LOGIC_VECTOR (1 downto 0);
    signal S_sim, MEM_CACHE_1_sim, MEM_CACHE_2_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal RES_OUT_sim : STD_LOGIC_VECTOR(7 downto 0);

begin
    MyComponentSelOUTunderTest : SelOUTUAL
    port map (
        SEL_OUT => SEL_OUT_sim,
        MEM_CACHE_1 => MEM_CACHE_1_sim,
        MEM_CACHE_2 => MEM_CACHE_2_sim,
        S => S_sim,
        RES_OUT => RES_OUT_sim
    );

    MyStimulus_Proc : process
    begin
        MEM_CACHE_1_sim <= "01010101";
        MEM_CACHE_2_sim <= "10101010";
        S_sim <= "10000001";
        SEL_OUT_sim <= "00";
        for i in 0 to 3 loop
            SEL_OUT_sim <= std_logic_vector(to_unsigned(i,2));
            wait for 100 us;
            report std_logic'image(SEL_OUT_sim(1)) & std_logic'image(SEL_OUT_sim(0));
            report "RES OUT : " & std_logic'image(RES_OUT_sim(7)) & std_logic'image(RES_OUT_sim(6)) & std_logic'image(RES_OUT_sim(5)) & std_logic'image(RES_OUT_sim(4)) & std_logic'image(REs_OUT_sim(3)) & std_logic'image(RES_OUT_sim(2)) & std_logic'image(RES_OUT_sim(1)) & std_logic'image(RES_OUT_sim(0));
            case( SEL_OUT_sim ) is
                when "00" =>
                    assert RES_OUT_sim = "00000000";
                when "01" =>
                    assert RES_OUT_sim = MEM_CACHE_1_sim;
                when "01" =>
                    assert RES_OUT_sim = MEM_CACHE_2_sim;
                when "01" =>
                    assert RES_OUT_sim = S_sim;
                when others =>
            end case ;
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;
end mySelOutUALtestbench_Arch;
