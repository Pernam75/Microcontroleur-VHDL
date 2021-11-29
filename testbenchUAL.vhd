library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity myUALtestbench is 

end myUALtestbench;

architecture myUALtestbench_Arch of myUALtestbench is

	-- Déclaration du composant à tester -> renvoie vers l'entité ET2 !
    component UAL is
    port (
        A : in std_logic_vector (3 downto 0);
        B : in std_logic_vector (3 downto 0);
        sel_FCT : in std_logic_vector (3 downto 0);
        S : out std_logic_vector (7 downto 0);
        SR_IN_L : in std_logic;
        SR_IN_R : in std_logic;
        SR_OUT_L : out std_logic;
        SR_OUT_R : out std_logic);
    end component;
    -- Déclaration des signaux internes à l'architecture pour résilier les simulations 
    signal A_sim, B_sim, sel_FCT_sim : std_logic_vector(3 downto 0) :=  (others => '0');
    signal S_sim : std_logic_vector(7 downto 0) :=  (others => '0');
    signal SR_IN_L_sim, SR_IN_R_sim, SR_OUT_L_sim, SR_OUT_R_sim : std_logic := '0';
    
begin 
    MyComponentUALunderTest : UAL
    port map (
        A => A_sim,
        B => B_sim,
        SR_IN_L => SR_IN_L_sim,
        SR_IN_R => SR_IN_R_sim,
        SR_OUT_L => SR_OUT_L_sim,
        SR_OUT_R => SR_OUT_R_sim,
        S => S_sim,
        sel_FCT => sel_FCT_sim
    );
    
    
    MyStimulus_Proc2 : process
    begin
        for i in 0 to 15 loop
     		A_sim <= "0001";
            B_sim <= "0010";
            SR_IN_L_sim <= '0';
            SR_IN_R_sim <= '0';
            SR_OUT_L_sim <= '0';
            SR_OUT_R_sim <= '0';
        	sel_FCT_sim <= std_logic_vector(to_unsigned(i,4));
            wait for 100 us;
            report std_logic'image(sel_FCT_sim(3)) & std_logic'image(sel_FCT_sim(2)) & std_logic'image(sel_FCT_sim(1)) & std_logic'image(sel_FCT_sim(0));
            report "sortie : " & std_logic'image(S_sim(7)) & std_logic'image(S_sim(6)) & std_logic'image(S_sim(5)) & std_logic'image(S_sim(4)) & std_logic'image(S_sim(3)) & std_logic'image(S_sim(2)) & std_logic'image(S_sim(1)) & std_logic'image(S_sim(0));
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;

end myUALtestbench_Arch;