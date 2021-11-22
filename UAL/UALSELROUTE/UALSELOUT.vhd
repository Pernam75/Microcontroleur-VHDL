----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2021 11:12:03
-- Design Name: 
-- Module Name: UALSELOUT - UALSELOUT_Arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UALSELOUT is
    Port ( 
        SEL_OUT : in STD_LOGIC_VECTOR (1 downto 0);
        S : in STD_LOGIC_VECTOR (7 downto 0);
        Mem_1_out : in STD_LOGIC_VECTOR (7 downto 0);
        Mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
        Res_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end UALSELOUT;

architecture UALSELOUT_Arch of UALSELOUT is

begin

    MySelRouteProc : process (SEL_OUT, S, Mem_1_out, Mem_2_out)
    begin
        case SEL_OUT is
            when "00" => -- Aucune sortie : RES_OUT = 0
                Res_out <= (others => '0');
            when "01" => -- RES_OUT = MEM_CACHE_1
                Res_out <= Mem_1_out;
            when "10" => -- RES_OUT = MEM_CACHE_2
               Res_out <= Mem_2_out;
            when others => -- RES_OUT = S
                Res_out <= S;
        end case;
    end process;

end UALSELOUT_Arch;
