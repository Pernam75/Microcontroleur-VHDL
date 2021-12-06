library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity CoeurTB is

end CoeurTB;

architecture CoeurTB_Arch of CoeurTB is

    component TP_Coeur is

      port(
        A: in STD_LOGIC_VECTOR (3 downto 0);
        B: in STD_LOGIC_VECTOR (3 downto 0);
        SR_IN_L : in STD_LOGIC;
        SR_IN_R : in STD_LOGIC;
        SR_OUT_R : out STD_LOGIC;
        SR_OUT_L : out STD_LOGIC;
        S : out STD_LOGIC_VECTOR (7 downto 0);
        SEL_FCT : in STD_LOGIC_VECTOR(3 downto 0));
       end component;
 
    signal My_A_sim, My_B_sim, My_SEL_FCT_sim : std_logic_vector (3 downto 0);
    signal My_SR_IN_L_sim, MY_SR_IN_R_sim, MY_SR_OUT_R_sim, MY_SR_OUT_L_sim : std_logic;
    signal MY_S_sim : std_logic_vector (7 downto 0);


begin
    Coeurundertest : TP_Coeur
    port map (
        A => My_A_sim,
        B => My_B_sim,
        SR_IN_L => My_SR_IN_L_sim,
        SR_IN_R => My_SR_IN_R_sim,
        SR_OUT_R => My_SR_OUT_R_sim,
        SR_OUT_L => My_SR_OUT_L_sim,
        S => My_S_sim,
        SEL_FCT => My_SEL_FCT_sim
     );
     MyStimulus_Proc : process
     begin
        for i in 0 to 15 loop
            My_A_sim <= "0001";
            My_B_sim <= "0010";
            My_SR_IN_L_sim <= '0';
            My_SR_IN_R_sim <= '0';
            My_SEL_FCT_sim <= std_logic_vector(to_unsigned(i,4));
            wait for 100 us;
            report std_logic'image(My_SEL_FCT_sim(3)) & std_logic'image(My_SEL_FCT_sim(2)) & std_logic'image(My_SEL_FCT_sim(1)) & std_logic'image(My_SEL_FCT_sim(0));
            report integer'image(to_integer(unsigned(My_S_sim)));
        end loop;
        report "pas de problème";
        wait;
    end process;
end;
