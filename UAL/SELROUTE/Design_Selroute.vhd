library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UAL_SELROUTE is
    Port ( 
            SEL_ROUTE : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (7 downto 0);
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Mem_1_out : in STD_LOGIC_VECTOR (7 downto 0);
            Mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
            BuffA_in : out STD_LOGIC_VECTOR (3 downto 0);
            BuffB_in : out STD_LOGIC_VECTOR (3 downto 0);
            Mem_1_in : out STD_LOGIC_VECTOR (7 downto 0);
            Mem_2_in : out STD_LOGIC_VECTOR (7 downto 0);
            BuffA_val : out STD_LOGIC;
            BuffB_val : out STD_LOGIC;
            Mem1_val : out STD_LOGIC;
            Mem2_val : out STD_LOGIC            
    );
end UAL_SELROUTE;

architecture UALSELROUTE_Arch of UAL_SELROUTE is

begin

    MySelRouteProc : process (SEL_ROUTE, S, A, B, Mem_1_out, Mem_2_out)
    begin
        case SEL_ROUTE is
            when "0000" =>
                BuffA_in <= A;
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0001" =>
                BuffA_in <= Mem_1_out(3 downto 0);
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0010" =>
                BuffA_in <= Mem_1_out(7 downto 4);
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                
            when "0011" =>
                BuffA_in <= Mem_2_out(3 downto 0);
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0100" =>
                BuffA_in <= Mem_2_out(7 downto 4);
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0101" =>
                BuffA_in <= S(3 downto 0);
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0110" =>
                BuffA_in <= S(7 downto 4);
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0111" =>
                BuffA_in <= (others => '0');
                BuffB_in <= B;
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1000" =>
                BuffA_in <= (others => '0');
                BuffB_in <= Mem_1_out(3 downto 0);
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1001" =>
                BuffA_in <= (others => '0');
                BuffB_in <= Mem_1_out(7 downto 4);
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                
            when "1010" =>
                BuffA_in <= (others => '0');
                BuffB_in <= Mem_2_out(3 downto 0);
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1011" =>
                BuffA_in <= (others => '0');
                BuffB_in <= Mem_1_out(7 downto 4);
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1100" =>
                BuffA_in <= (others => '0');
                BuffB_in <= S(3 downto 0);
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1101" =>
                BuffA_in <= (others => '0');
                BuffB_in <= S(7 downto 4);
                Mem_1_in <= (others => '0');
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1110" =>
                BuffA_in <= (others => '0');
                BuffB_in <= (others => '0');
                Mem_1_in <= S;
                Mem_2_in <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '0';
                Mem1_val <= '1';
                Mem2_val <= '0';
            
            when others =>
                BuffA_in <= (others => '0');
                BuffB_in <= (others => '0');
                Mem_1_in <= (others => '0');
                Mem_2_in <= S;
                BuffA_val <= '0';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '1';
        end case;
    end process;

end UALSELROUTE_Arch;
