library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
            when "0000" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= A;
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0001" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory1_OUT(3 downto 0);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0010" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory1_OUT(7 downto 4);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
                
            when "0011" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory2_OUT(3 downto 0);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0100" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= Buffer_Memory2_OUT(7 downto 4);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0101" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= S(3 downto 0);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0110" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= S(7 downto 4);
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "0111" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= B;
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1000" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory1_OUT(3 downto 0);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1001" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory1_OUT(7 downto 4);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
                
            when "1010" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory2_OUT(3 downto 0);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1011" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= Buffer_Memory1_OUT(7 downto 4);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1100" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= S(3 downto 0);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1101" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= S(7 downto 4);
                Buffer_Memory1_IN <= (others => '0');
                Buffer_Memory2_IN <= (others => '0');
            
            when "1110" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '1';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_IN <= (others => '0');
                Buffer_B_IN <= (others => '0');
                Buffer_Memory1_IN <= S;
                Buffer_Memory2_IN <= (others => '0');
            
            when others =>
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
