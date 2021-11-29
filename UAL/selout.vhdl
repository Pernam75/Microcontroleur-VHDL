library IEEE;
use IEEE.std_logic_1164.all;


entity UAL_SELOUT is
    Port ( 
        S, MEM_CACHE_1, MEM_CACHE_2, RES_OUT : in STD_LOGIC_VECTOR (7 downto 0);
        SEL_OUT : in STD_LOGIC_VECTOR (1 downto 0);
    );
end UAL_SELOUT;


architecture UAL_SELOUT_Arch of UAL_SELOUT is

begin

    SEL_OUT_process : process (SEL_OUT, S, MEM_CACHE_1, MEM_CACHE_2)
    begin
        case SEL_OUT is
        
            when "00" =>
            	
                RES_OUT <= (others => '0');
                
            when "01" =>
                RES_OUT <= MEM_CACHE_1;
                
            when "10" => 
               RES_OUT <= MEM_CACHE_2;
               
            when others =>
                RES_OUT <= S;
                
        end case;
    end process;

end UAL_SELOUT_Arch;
