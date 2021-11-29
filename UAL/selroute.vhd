library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UAL_SELROUTE is
    Port ( 
            SEL_ROUTE, A, B : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (7 downto 0);
            buff_A_out, buff_B_out : in STD_LOGIC_VECTOR (3 downto 0);
            mem_1_out, mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
            buff_A_in, buff_B_in : out STD_LOGIC_VECTOR (3 downto 0);
            mem_1_in, mem_2_in : out STD_LOGIC_VECTOR (7 downto 0);
            BuffA_val, BuffB_val : out STD_LOGIC;
            Mem1_val, Mem2_val  : out STD_LOGIC;           
    );
end UAL_SELROUTE;

architecture UAL_SELROUTE_Arch of UAL_SELROUTE is

begin

    MySELROUTEProc : process (SEL_ROUTE, S, A, B, buff_A_out, buff_B_out, mem_1_out, mem_2_out)
    begin
        case SEL_ROUTE is
            when "0000" =>
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= A;
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0001" =>
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= mem_1_out(3 downto 0);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0010" =>
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= mem_1_out(7 downto 4);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
                
            when "0011" =>
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= mem_2_out(3 downto 0);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0100" =>
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= mem_2_out(7 downto 4);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0101" =>
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= S(3 downto 0);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0110" =>
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= S(7 downto 4);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0111" =>
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= B;
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1000" =>
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_1_out(3 downto 0);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1001" =>
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_1_out(7 downto 4);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
                
            when "1010" =>
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_2_out(3 downto 0);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1011" =>
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_1_out(7 downto 4);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1100" =>
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= S(3 downto 0);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1101" =>
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= S(7 downto 4);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1110" =>
                BuffA_val <= '0';
                BuffB_val <= '0';
                Mem1_val <= '1';
                Mem2_val <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= (others => '0');
                mem_1_In <= S;
                mem_2_In <= (others => '0');
            
            when others =>
                BuffA_val <= '0';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '1';
                buff_A_in <= (others => '0');
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= S;
        end case;
    end process;

end UAL_SELROUTE_Arch;
