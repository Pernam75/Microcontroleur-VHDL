-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ET2 is
port (
  e1 : in std_logic;
  e2 : in std_logic;
  s1 : out std_logic
);
end ET2;

architecture ET2_DataFlow of ET2 is begin
	MyET2ProcessFlag : process (e1, e2)
    begin
    	s1 <= e1 and e2;
        end process;
        
end ET2_DataFlow;