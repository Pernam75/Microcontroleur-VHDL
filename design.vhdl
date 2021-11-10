-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity UAL is

port (
    A : in std_logic_vector (3 downto 0);
    B : in std_logic_vector (3 downto 0);
    sel_FCT : in std_logic;
    S : out std_logic_vector (7 downto 0);
    SR_IN_L : out std_logic;
    SR_IN_R : out std_logic;
    SR_OUT_L : out std_logic;
    SR_OUT_R : out std_logic
);
end UAL;

architecture UAL_DataFlow of UAL is 
	
    signal My_A : std_logic_vector (3 downto 0);
    signal My_B : std_logic_vector (3 downto 0);
    signal My_SR_IN_R : std_logic_vector (3 downto 0);
    signal My_S : std_logic_vector (7 downto 0);

begin
	
    -- process explicite - intstructions séquentielle
    UALProc : process (sel_FCT, A, B, S, SR_IN_L, SR_IN_R, SR_OUT_L, SR_OUT_R)
    begin
      case sel_FCT is
      when "0000" =>
      	S (7 downto 0) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "0001" =>
      	S (3 downto 0) <= A;
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "0010" =>
      	S (3 downto 0) <= B;
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "0011" =>
      	S (3 downto 0) <= not A;
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "0100" =>
      	S (3 downto 0) <= not B;
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "0101" =>
      	S (3 downto 0) <= A and B;
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "0110" =>
      	S (3 downto 0) <= A or B;
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "0111" =>
      	S (3 downto 0) <= A xor B;
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when "1000" =>
      	S(3) <= SR_IN_L;
        S(2 downto 0) <= A(3 downto 1);
        S (7 downto 4) <= (others => '0');
        SR_OUT_R <= A(0);
      when "1001" =>
      	S(0) <= SR_IN_R;
      	S (3 downto 1) <= A(2 downto 0);
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= A(3);
      when "1010" =>
      	S(3) <= SR_IN_L;
        S(2 downto 0) <= B(3 downto 1);
        S (7 downto 4) <= (others => '0');
        SR_OUT_R <= B(0);
      when "1011" =>
      	S(0) <= SR_IN_R;
      	S (3 downto 1) <= B(2 downto 0);
        S (7 downto 4) <= (others => '0');
        SR_OUT_L <= B(3);
      when "1100" =>
      	My_A <= '0' & A;
    	My_B <= '0' & B;
	    My_SR_IN_R(N downto 1) <= (others => '0');
    	My_SR_IN_R(0) <= SR_IN_R;
        S <= My_S(3 downto 0);
        S(5) <= My_s1(4);
        My_S <= My_A + My_B + My_SR_In_R;
      when "1101" =>
        My_A <= '0' & A;
    	My_B <= '0' & B;
        S <= My_S(3 downto 0);
        S(5) <= My_s1(4);
        My_S <= My_A + My_B;
      when "1110" =>
      	My_A <= '0' & A;
    	My_B <= '0' & B;
        S <= My_S(3 downto 0);
        S(5) <= My_s1(4);
        My_S <= My_A - My_B;
      when "1111" =>
    	My_A <= '0' & A;
    	My_B <= '0' & B;
        S <= My_S(3 downto 0);
        S(5) <= My_s1(4);
        My_S <= My_A * My_B;
      when others => report "c'est cassé";
    end case;
    end process;
    
end UAL_DataFlow;
