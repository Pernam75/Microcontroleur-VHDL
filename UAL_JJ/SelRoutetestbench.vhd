library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity mySEL_ROUTEtestbench is 

end mySEL_ROUTEtestbench;

architecture mySEL_ROUTEtestbench_Arch of mySEL_ROUTEtestbench is

	-- Déclaration du composant à tester -> renvoie vers l'entité ET2 !
    component SelRouteUAL is
    Port ( 
            S : in STD_LOGIC_VECTOR (7 downto 0);
            SEL_ROUTE, A, B : in STD_LOGIC_VECTOR (3 downto 0);
            Buffer_A_OUT, Buffer_B_OUT : out STD_LOGIC_VECTOR (3 downto 0);
            Buffer_A_IN, Buffer_B_IN : in std_logic_vector(3 downto 0);
            Buffer_Memory1_OUT, Buffer_Memory2_OUT : out STD_LOGIC_VECTOR (7 downto 0);
            Buffer_Memory1_IN, Buffer_Memory2_IN : in STD_LOGIC_VECTOR (7 downto 0);
            CE_Buffer_A, CE_Buffer_B, CE_Buffer_Memory1, CE_Buffer_Memory2 : out STD_LOGIC            
    );
    end component;
    -- Déclaration des signaux internes à l'architecture pour résilier les simulations 
    signal S_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal SEL_ROUTE_sim, A_sim, B_sim : STD_LOGIC_VECTOR (3 downto 0);
    signal Buffer_A_OUT_sim, Buffer_B_OUT_sim, Buffer_A_IN_sim, Buffer_B_IN_sim : STD_LOGIC_VECTOR (3 downto 0);
    signal Buffer_Memory1_OUT_sim, Buffer_Memory2_OUT_sim, Buffer_Memory1_IN_sim, Buffer_Memory2_IN_sim : STD_LOGIC_VECTOR (7 downto 0);
    signal CE_Buffer_A_sim, CE_Buffer_B_sim, CE_Buffer_Memory1_sim, CE_Buffer_Memory2_sim : STD_LOGIC;
    
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
    	A_sim <= "1001";
        B_sim <= "1100";
        Buffer_Memory1_IN_sim <= "00100101";
        Buffer_Memory2_IN_sim <= "01100001";
        S_sim <= "11000001";
        for i in 0 to 15 loop
        	SEL_ROUTE_sim <= std_logic_vector(to_unsigned(i,4));
            wait for 100 us;
            report std_logic'image(SEL_ROUTE_sim(3)) & std_logic'image(SEL_ROUTE_sim(2)) & std_logic'image(SEL_ROUTE_sim(1)) & std_logic'image(SEL_ROUTE_sim(0));
            report "CE_Buffer_A : " & std_logic'image(CE_Buffer_A_sim)&" ; CE_Buffer_B : " & std_logic'image(CE_Buffer_B_sim) & " ; CE_Buffer_Memory1 : " & std_logic'image(CE_Buffer_Memory1_sim) & " ; CE_Buffer_Memory2 : " & std_logic'image(CE_Buffer_Memory2_sim);
            report "Buffer A OUT : " & std_logic'image(Buffer_A_OUT_sim(3)) & std_logic'image(Buffer_A_OUT_sim(2)) & std_logic'image(Buffer_A_OUT_sim(1)) & std_logic'image(Buffer_A_OUT_sim(0));
            report "Buffer B OUT : " & std_logic'image(Buffer_B_OUT_sim(3))&std_logic'image(Buffer_B_OUT_sim(2))&std_logic'image(Buffer_B_OUT_sim(1))&std_logic'image(Buffer_B_OUT_sim(0));
            report "Buffer Memory 1 : " & std_logic'image(Buffer_Memory1_OUT_sim(7)) & std_logic'image(Buffer_Memory1_OUT_sim(6)) & std_logic'image(Buffer_Memory1_OUT_sim(5)) & std_logic'image(Buffer_Memory1_OUT_sim(4)) & std_logic'image(Buffer_Memory1_OUT_sim(3)) & std_logic'image(Buffer_Memory1_OUT_sim(2)) & std_logic'image(Buffer_Memory1_OUT_sim(1)) & std_logic'image(Buffer_Memory1_OUT_sim(0));
            report "Buffer Memory 2 : " & std_logic'image(Buffer_Memory2_OUT_sim(7)) & std_logic'image(Buffer_Memory2_OUT_sim(6)) & std_logic'image(Buffer_Memory2_OUT_sim(5)) & std_logic'image(Buffer_Memory2_OUT_sim(4)) & std_logic'image(Buffer_Memory2_OUT_sim(3)) & std_logic'image(Buffer_Memory2_OUT_sim(2)) & std_logic'image(Buffer_Memory2_OUT_sim(1)) & std_logic'image(Buffer_Memory2_OUT_sim(0));
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;

end mySEL_ROUTEtestbench_Arch;
