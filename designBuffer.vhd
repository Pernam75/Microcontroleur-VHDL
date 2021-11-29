-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity buffer_A is 
generic (
    N : integer := 4
);
port (
    e1 : in std_logic_vector (N-1 downto 0);
    reset : in std_logic;
    preset : in std_logic;
    clock : in std_logic;
    s1 : out std_logic_vector (N-1 downto 0)
);
end buffer_A;

architecture buffer_A_Arch of buffer_A is

begin
    
    -- process explicite - instructions séquentielles
    MyBuffer_AProc : process (reset, clock)
    begin
        if (reset = '1') then
            s1 <= (others => '0');
        elsif (rising_edge(clock)) then
            if (preset = '1') then
                s1 <= (others => '1');
            else
                s1 <= e1;
            end if;
        end if;
     end process;

end buffer_A_Arch;