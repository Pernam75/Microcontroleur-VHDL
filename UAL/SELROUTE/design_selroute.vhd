library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UAL_SELROUTE is
    Port ( 
            SEL_ROUTE, A, B : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (7 downto 0);
            buff_A_out, buff_B_out : out STD_LOGIC_VECTOR (3 downto 0);
            mem_1_out, mem_2_out : out STD_LOGIC_VECTOR (7 downto 0);
            buff_A_in, buff_B_in : in STD_LOGIC_VECTOR (3 downto 0);
            mem_1_in, mem_2_in : in STD_LOGIC_VECTOR (7 downto 0);
            BuffA_val, BuffB_val : out STD_LOGIC;
            mem1_val, mem2_val  : out STD_LOGIC           
    );
end UAL_SELROUTE;

architecture UAL_SELROUTE_Arch of UAL_SELROUTE is

begin

    MySELROUTEProc : process (SEL_ROUTE, S, A, B, buff_A_in, buff_B_in, mem_1_in, mem_2_in)
    begin
        case SEL_ROUTE is
            when "0000" =>
                buff_A_out <= A;
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0001" =>
                buff_A_out <= mem_1_in(3 downto 0);
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0010" =>
                buff_A_out <= mem_1_in(7 downto 4);
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
                
            when "0011" =>
                buff_A_out <= mem_2_in(3 downto 0);
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0100" =>
                buff_A_out <= mem_2_in(7 downto 4);
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0101" =>
                buff_A_out <= S(3 downto 0);
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0110" =>
                buff_A_out <= S(7 downto 4);
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '1';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "0111" =>
                buff_A_out <= (others => '0');
                buff_B_out <= B;
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1000" =>
                buff_A_out <= (others => '0');
                buff_B_out <= mem_1_in(3 downto 0);
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1001" =>
                buff_A_out <= (others => '0');
                buff_B_out <= mem_1_in(7 downto 4);
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
                
            when "1010" =>
                buff_A_out <= (others => '0');
                buff_B_out <= mem_2_in(3 downto 0);
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1011" =>
                buff_A_out <= (others => '0');
                buff_B_out <= mem_1_in(7 downto 4);
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1100" =>
                buff_A_out <= (others => '0');
                buff_B_out <= S(3 downto 0);
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1101" =>
                buff_A_out <= (others => '0');
                buff_B_out <= S(7 downto 4);
                mem_1_out <= (others => '0');
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '1';
                Mem1_val <= '0';
                Mem2_val <= '0';
            
            when "1110" =>
                buff_A_out <= (others => '0');
                buff_B_out <= (others => '0');
                mem_1_out <= S;
                mem_2_out <= (others => '0');
                BuffA_val <= '0';
                BuffB_val <= '0';
                Mem1_val <= '1';
                Mem2_val <= '0';
            
            when others =>
                buff_A_out <= (others => '0');
                buff_B_out <= (others => '0');
                mem_1_out <= (others => '0');
                mem_2_out <= S;
                BuffA_val <= '0';
                BuffB_val <= '0';
                Mem1_val <= '0';
                Mem2_val <= '1';
        end case;
    end process;

end UAL_SELROUTE_Arch;
