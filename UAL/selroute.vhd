library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UAL_SELROUTE is
    Port ( 
            SEL_ROUTE : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (7 downto 0);
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            buff_A_out : in STD_LOGIC_VECTOR (3 downto 0);
            buff_B_out : in STD_LOGIC_VECTOR (3 downto 0);
            mem_1_out : in STD_LOGIC_VECTOR (7 downto 0);
            mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
            buff_A_in : out STD_LOGIC_VECTOR (3 downto 0);
            buff_B_in : out STD_LOGIC_VECTOR (3 downto 0);
            mem_1_In : out STD_LOGIC_VECTOR (7 downto 0);
            mem_2_In : out STD_LOGIC_VECTOR (7 downto 0);
            ce_buff_A : out STD_LOGIC;
            ce_buff_B : out STD_LOGIC;
            ce_mem_1 : out STD_LOGIC;
            ce_mem_2 : out STD_LOGIC            
    );
end UAL_SELROUTE;

architecture UAL_SELROUTE_Arch of UAL_SELROUTE is

begin

    MySELROUTEProc : process (SEL_ROUTE, S, A, B, buff_A_out, buff_B_out, mem_1_out, mem_2_out)
    begin
        case SEL_ROUTE is
            when "0000" =>
                ce_buff_A <= '1';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= A;
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0001" =>
                ce_buff_A <= '1';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= mem_1_out(3 downto 0);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0010" =>
                ce_buff_A <= '1';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= mem_1_out(7 downto 4);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
                
            when "0011" =>
                ce_buff_A <= '1';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= mem_2_out(3 downto 0);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0100" =>
                ce_buff_A <= '1';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= mem_2_out(7 downto 4);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0101" =>
                ce_buff_A <= '1';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= S(3 downto 0);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0110" =>
                ce_buff_A <= '1';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= S(7 downto 4);
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "0111" =>
                ce_buff_A <= '0';
                ce_buff_B <= '1';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= B;
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1000" =>
                ce_buff_A <= '0';
                ce_buff_B <= '1';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_1_out(3 downto 0);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1001" =>
                ce_buff_A <= '0';
                ce_buff_B <= '1';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_1_out(7 downto 4);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
                
            when "1010" =>
                ce_buff_A <= '0';
                ce_buff_B <= '1';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_2_out(3 downto 0);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1011" =>
                ce_buff_A <= '0';
                ce_buff_B <= '1';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= mem_1_out(7 downto 4);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1100" =>
                ce_buff_A <= '0';
                ce_buff_B <= '1';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= S(3 downto 0);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1101" =>
                ce_buff_A <= '0';
                ce_buff_B <= '1';
                ce_mem_1 <= '0';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= S(7 downto 4);
                mem_1_In <= (others => '0');
                mem_2_In <= (others => '0');
            
            when "1110" =>
                ce_buff_A <= '0';
                ce_buff_B <= '0';
                ce_mem_1 <= '1';
                ce_mem_2 <= '0';
                buff_A_in <= (others => '0');
                buff_B_in <= (others => '0');
                mem_1_In <= S;
                mem_2_In <= (others => '0');
            
            when others =>
                ce_buff_A <= '0';
                ce_buff_B <= '0';
                ce_mem_1 <= '0';
                ce_mem_2 <= '1';
                buff_A_in <= (others => '0');
                buff_B_in <= (others => '0');
                mem_1_In <= (others => '0');
                mem_2_In <= S;
        end case;
    end process;

end UAL_SELROUTE_Arch;
