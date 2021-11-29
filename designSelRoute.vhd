library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SelRouteUAL is
    Port ( 
            S : in STD_LOGIC_VECTOR (7 downto 0);
            SEL_ROUTE, A, B : in STD_LOGIC_VECTOR (3 downto 0);
            Buffer_A_OUT, Buffer_B_OUT, Buffer_A_IN, Buffer_B_IN : in STD_LOGIC_VECTOR (3 downto 0);
            Buffer_Memory1_OUT, Buffer_Memory2_OUT, Buffer_Memory1_IN, Buffer_Memory2_IN : out STD_LOGIC_VECTOR (7 downto 0);
            CE_Buffer_A, CE_Buffer_B, CE_Buffer_Memory1, CE_Buffer_Memory2 : out STD_LOGIC            
    );
end SelRouteUAL;

architecture SelRouteDataFlow of SelRouteUAL is

begin

    MySelRouteProc : process (SEL_ROUTE, S, A, B, Buffer_A_OUT, Buffer_B_OUT, Buffer_Memory1_OUT, Buffer_Memory2_OUT)
    begin
        case SEL_ROUTE is
            when "0000" => -- Stockage de l'entr�e A_IN dans Buffer_A
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= A;
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0001" => -- Stockage de MEM_CACHE_1 dans Buffer_A (4 bits de poids faibles)
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory1_OUT(3 downto 0);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0010" => -- Stockage de MEM_CACHE_1 dans Buffer_A (4 bits de poids forts)
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory1_OUT(7 downto 4);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
                
            when "0011" => -- Stockage de MEM_CACHE_2 dans Buffer_A (4 bits de poids faibles)
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory2_OUT(3 downto 0);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0100" => -- Stockage de MEM_CACHE_2 dans Buffer_A (4 bits de poids forts)
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory2_OUT(7 downto 4);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0101" => -- Stockage de S dans Buffer_A (4 bits de poids faibles)
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= S(3 downto 0);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0110" => -- Stockage de S dans Buffer_A (4 bits de poids forts)
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= S(7 downto 4);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0111" => -- Stockage de l'entr�e B_IN dans Buffer_B
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= B;
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1000" => -- Stockage de MEM_CACHE_1 dans Buffer_B (4 bits de poids faibles)
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory1_OUT(3 downto 0);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1001" => -- Stockage de MEM_CACHE_1 dans Buffer_B (4 bits de poids forts)
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory1_OUT(7 downto 4);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
                
            when "1010" => -- Stockage de MEM_CACHE_2 dans Buffer_B (4 bits de poids faibles)
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory2_OUT(3 downto 0);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1011" => -- Stockage de MEM_CACHE_2 dans Buffer_B (4 bits de poids forts)
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory1_OUT(7 downto 4);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1100" => -- Stockage de S dans Buffer_B (4 bits de poids faibles)
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= S(3 downto 0);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1101" => -- Stockage de S dans Buffer_B (4 bits de poids forts)
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= S(7 downto 4);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1110" => -- Stockage de S dans MEM_CACHE_1
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '1';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= S;
                Buffer_Memory2_IN <= (others => '0');
            
            when others => -- Stockage de S dans MEM_CACHE_2
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '1';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= S;
        end case;
    end process;

end SelRouteDataFlow;
