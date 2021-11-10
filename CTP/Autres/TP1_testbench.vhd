-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity myET2testbench is

end myET2testbench;

architecture myET2testbench_Arch of myET2testbench is
	component ET2
    port (
      e1 : in std_logic;
      e2 : in std_logic;
      s1 : out std_logic
 	);
    end component;
    
	signal e1_sim, e2_sim : std_logic := '0';
    signal s1_sim 		  : std_logic := '0';
begin
	MyComponentET2underTest : ET2
    
    port map (
    	e1 => e1_sim,
        e2 => e2_sim,
        s1 => s1_sim
	);
	
    -- MyStimulus_e1_sim_e2_sim_Proc : process
    -- begin
    -- 	e1_sim <= '0';
    --     e2_sim <= '0';
    --     wait for 100 us;
    --     assert s1_sim = (e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) & " | e2_sim = " & std_logic'image(e2_sim) & " | s1_sim = " & std_logic'image(s1_sim) severity note;
    --     e1_sim <= '0';
    --     e2_sim <= '1';
    --     wait for 100 us;
    --     assert s1_sim = (e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) & " | e2_sim = " & std_logic'image(e2_sim) & " | s1_sim = " & std_logic'image(s1_sim) severity warning;
    --     e1_sim <= '1';
    --     e2_sim <= '0';
    --     wait for 100 us;
    --     assert s1_sim = (e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) & " | e2_sim = " & std_logic'image(e2_sim) & " | s1_sim = " & std_logic'image(s1_sim) severity error;
    --     e1_sim <= '1';
    --     e2_sim <= '1';
    --     wait for 100 us;
    --     assert s1_sim = (e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) & " | e2_sim = " & std_logic'image(e2_sim) & " | s1_sim = " & std_logic'image(s1_sim) severity failure;
        
    --     report "Test ok (no assert...)";
        
    --     wait;

	-- end process;

    MyStimulus_e1e2Input_Proc2 : process
    begin
        for i in 0 to 1 loop
            for j in 0 to 1 loop
                e1_sim <= to_unsigned(i,1)(0);
                e2_sim <= to_unsigned(j,1)(0);
                wait for 100 us;
                assert s1_sim = (e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) & " | e2_sim = " & std_logic'image(e2_sim) & " | s1_sim = " & std_logic'image(s1_sim) severity failure;
            end loop;
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process;
end myET2testbench_Arch;