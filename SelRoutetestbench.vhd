library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity mySEL_ROUTEtestbench is 

end mySEL_ROUTEtestbench;

architecture mySEL_ROUTEtestbench_Arch of mySEL_ROUTEtestbench is

	-- Déclaration du composant à tester -> renvoie vers l'entité ET2 !
    component SelRouteUAL is
    port (
        SEL_ROUTE, A, B, Buffer_A_OUT, Buffer_B_OUT, Buffer_A_IN, Buffer_B_IN : in std_logic_vector (3 downto 0);
        Buffer_Memory1_OUT, Buffer_Memory2_OUT, Buffer_Memory1_IN, Buffer_Memory2_IN : out STD_LOGIC_VECTOR (7 downto 0);
        S : in std_logic_vector(7 downto 0);
        CE_Buffer_A, CE_Buffer_B, CE_Buffer_Memory1, CE_Buffer_Memory2 : out std_logic
    );
    end component;
    -- Déclaration des signaux internes à l'architecture pour résilier les simulations 
    signal A_sim, B_sim, Buffer_A_OUT_sim, Buffer_B_OUT_sim, Buffer_A_IN_sim, Buffer_B_IN_sim, SEL_ROUTE_sim : std_logic_vector(3 downto 0);
    signal S_sim, Buffer_Memory1_OUT_sim, Buffer_Memory2_OUT_sim, Buffer_Memory1_IN_sim, Buffer_Memory2_IN_sim : std_logic_vector(7 downto 0);
    signal CE_Buffer_A_sim, CE_Buffer_B_sim, CE_Buffer_Memory1_sim, CE_Buffer_Memory2_sim : std_logic := '0';
    
begin 
    MyComponentSEL_ROUTEunderTest : SelRouteUAL
    port map (
        SEL_ROUTE => SEL_ROUTE_sim,
        CE_Buffer_A => CE_Buffer_A_sim,
        CE_Buffer_B => CE_Buffer_B_sim,
        CE_Buffer_Memory1 => CE_Buffer_Memory1_sim,
        CE_Buffer_Memory2 => CE_Buffer_Memory2_sim,
        S => S_sim,
        Buffer_Memory1_OUT => Buffer_Memory1_OUT_sim,
        Buffer_Memory2_OUT => Buffer_Memory2_OUT_sim,
        Buffer_Memory1_IN => Buffer_Memory1_IN_sim,
        Buffer_Memory2_IN => Buffer_Memory2_IN_sim,
        Buffer_A_OUT => Buffer_A_OUT_sim,
        Buffer_B_OUT => Buffer_B_OUT_sim,
        Buffer_A_IN => Buffer_A_IN_sim,
        Buffer_B_IN => Buffer_B_IN_sim,
        A => A_sim,
        B => B_sim
    );
    
    
    MyStimulus_Proc : process
    begin
        for i in 0 to 15 loop
        	SEL_ROUTE_sim <= std_logic_vector(to_unsigned(i,4));
            SEL_ROUTE_sim <= (others => '0');
            CE_Buffer_A_sim <= '0';
            CE_Buffer_B_sim <= '0';
            CE_Buffer_Memory1_sim <= '0';
            CE_Buffer_Memory2_sim <= '0';
            S_sim <= (others => '0');
            Buffer_Memory1_OUT_sim <= (others => '0');
            Buffer_Memory2_OUT_sim <= (others => '0');
            Buffer_Memory1_IN_sim <= (others => '0');
            Buffer_Memory2_IN_sim <= (others => '0');
            wait for 100 us;
            report std_logic'image(SEL_ROUTE_sim(3)) & std_logic'image(SEL_ROUTE_sim(2)) & std_logic'image(SEL_ROUTE_sim(1)) & std_logic'image(SEL_ROUTE_sim(0));
            report "CE_Buffer_A : "&std_logic'image(CE_Buffer_A_sim)&" ; CE_Buffer_B : "&std_logic'image(CE_Buffer_B_sim) & " ; CE_Buffer_Memory1 : " & std_logic'image(CE_Buffer_Memory1_sim) & " ; CE_Buffer_Memory2 : " & std_logic'image(CE_Buffer_Memory2_sim);
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;

end mySEL_ROUTEtestbench_Arch;
