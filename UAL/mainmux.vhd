library ieee;
use ieee.std_logic_1164.all;

entity MainMux is port(
    E0, E1, E2, E3, SEL0, SEL1: in STD_LOGIC;
    S: out STD_LOGIC);
end;

architecture MainMux_Arch of MainMux is

begin

    with SEL1 & SEL0 select
        S <= E0 when "00",
             E1 when "01",
             E2 when "10",
             E3 when others;
             
end MainMux_Arch;
