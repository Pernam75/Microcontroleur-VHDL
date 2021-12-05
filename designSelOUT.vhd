library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelOUTUAL is
    Port(
        SEL_OUT : in STD_LOGIC_VECTOR (1 downto 0);
        MEM_CACHE_1, MEM_CACHE_2, S : in STD_LOGIC_VECTOR (7 downto 0);
        RES_OUT : out STD_LOGIC_VECTOR(7 downto 0)
        );
end SelOUTUAL;

architecture SelOUTUAL_DataFlow of SelOUTUAL is
begin
    MySeLOUTUALProc : process (SEL_OUT, S, MEM_CACHE_1, MEM_CACHE_2)
    begin
        case SEL_OUT is
            when "00" =>
                RES_OUT <= (others => '0');
            when "01" =>
                RES_OUT <= MEM_CACHE_1;
            when "10" =>
                RES_OUT <= MEM_CACHE_2;
            when "11" =>
                RES_OUT <= S;
        end case;
    end process;
end SelOUTUAL_DataFlow;
