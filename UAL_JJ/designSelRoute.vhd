library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelRouteUAL is
    Port ( 
            S : in STD_LOGIC_VECTOR (7 downto 0);
            SEL_ROUTE, A, B : in STD_LOGIC_VECTOR (3 downto 0);
            Buffer_A_IN, Buffer_B_IN : in STD_LOGIC_VECTOR (3 downto 0);
            Buffer_A_OUT, Buffer_B_OUT : out std_logic_vector(3 downto 0);
            Buffer_Memory1_OUT, Buffer_Memory2_OUT : out STD_LOGIC_VECTOR (7 downto 0);
            Buffer_Memory1_IN, Buffer_Memory2_IN : in std_logic_vector(7 downto 0);
            CE_Buffer_A, CE_Buffer_B, CE_Buffer_Memory1, CE_Buffer_Memory2 : out STD_LOGIC            
    );
end SelRouteUAL;

architecture SelRouteDataFlow of SelRouteUAL is

begin

    MySelRouteProc : process (SEL_ROUTE, S, A, B, Buffer_A_IN, Buffer_B_IN, Buffer_Memory1_IN, Buffer_Memory2_IN)
    begin
        case SEL_ROUTE is
            when "0000" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= A;
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "0001" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= Buffer_Memory1_IN(3 downto 0);
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "0010" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= Buffer_Memory1_IN(7 downto 4);
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
                
            when "0011" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= Buffer_Memory2_IN(3 downto 0);
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "0100" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= Buffer_Memory2_IN(7 downto 4);
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "0101" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= S(3 downto 0);
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "0110" =>
                CE_Buffer_A <= '1';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= S(7 downto 4);
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "0111" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= B;
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "1000" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= Buffer_Memory1_IN(3 downto 0);
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "1001" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= Buffer_Memory1_IN(7 downto 4);
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
                
            when "1010" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= Buffer_Memory2_IN(3 downto 0);
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "1011" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= Buffer_Memory2_IN(7 downto 4);
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "1100" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= S(3 downto 0);
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "1101" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '1';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= S(7 downto 4);
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= (others => '0');
            
            when "1110" =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '1';
                CE_Buffer_Memory2 <= '0';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= S;
                Buffer_Memory2_OUT <= (others => '0');
            
            when others =>
                CE_Buffer_A <= '0';
                CE_Buffer_B <= '0';
                CE_Buffer_Memory1 <= '0';
                CE_Buffer_Memory2 <= '1';
                Buffer_A_OUT <= (others => '0');
                Buffer_B_OUT <= (others => '0');
                Buffer_Memory1_OUT <= (others => '0');
                Buffer_Memory2_OUT <= S;
        end case;
    end process;

end SelRouteDataFlow;
