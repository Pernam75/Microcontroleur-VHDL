-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Déclaration d'une entité pour la simulation sans ports d'entrées et de sorties
entity mybufferNbitstestbench is 

end mybufferNbitstestbench;

architecture mybufferNbitstestbench_Arch of mybufferNbitstestbench is

	-- Declaration du composant à tester -> renvoie vers l'entité bufferNbits
    component bufferNbits is 
    generic (N : integer);
    port (
    	e1 : in std_logic_vector (N-1 downto 0);
        reset : in std_logic;
        preset : in std_logic;
        clock : in std_logic;
        s1 : out std_logic_vector (N-1 downto 0)
    );
    end component;
    
    -- Déclaration de la constante pour le paramètre générique (non obligatoire)
    constant  N : integer := 3;
    
    -- Déclaration de la constante permettant de définir la période de l'horloge 
    constant PERIOD : time := 100 us;
    
    -- Déclaration des signaux internes à l'architecture pour réaliser les simulations 
    signal e1_sim : std_logic_vector(N-1 downto 0) := (others => '0');
    signal s1_sim, s1_calc : std_logic_vector(N-1 downto 0) := (others => '0');
    signal reset_sim, preset_sim, clock_sim : std_logic := '0';
    
begin
	
    -- Instanciation du composant à tester
    MyComponentsynthcomb01underTest : bufferNbits
    -- raccordement des ports du composant aux signaux dans l'architecture 
    generic map ( N => N )
    port map (
    	e1 => e1_sim,
        reset => reset_sim,
        preset => preset_sim,
        clock =>  clock_sim,
        s1 => s1_sim
        );

    -- Définition du process permettant de générer l'horloge pour le test
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

    -- Définition du process permettant de faire évoluer les signaux d'entrée du composant à tester
    MyStimulus_Proc2 : process -- pas de liste de sensibilité
    begin 	

        reset_sim <= '1';
        preset_sim <= '0';
        e1_sim <= (others => '0');
        s1_calc <= (others => '0');
        wait for 3.25 * PERIOD;
        report " reset =" & std_logic'image(reset_sim) & " | preset = " & std_logic'image(preset_sim) & " | e1 = " & integer'image(to_integer(unsigned(e1_sim))) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
        assert s1_sim = s1_calc report "Failure" severity failure;

        reset_sim <= '0';
        preset_sim <= '1';
        e1_sim <= (others => '0');
        s1_calc <= (others => '1');
        wait for 3.5 * PERIOD;
        report " reset =" & std_logic'image(reset_sim) & " | preset = " & std_logic'image(preset_sim) & " | e1 = " & integer'image(to_integer(unsigned(e1_sim))) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
        assert s1_sim = s1_calc report "Failure" severity failure;

        reset_sim <= '0';
        preset_sim <= '0';
        for i in 0 to (2**N)-1 loop
            e1_sim <= std_logic_vector(to_unsigned(i,N));
            wait for PERIOD;
            report "reset = " & std_logic'image(reset_sim) & " | preset =" & std_logic'image(preset_sim) & " | e1 = " & integer'image(i) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
        assert s1_sim = e1_sim report "Failure" severity failure;
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;
end mybufferNbitstestbench_Arch;
