-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity UAL is

port (
    A : in std_logic_vector (3 downto 0);
    B : in std_logic_vector (3 downto 0);
    sel_FCT : in std_logic_vector (3 downto 0);
    S : out std_logic_vector (7 downto 0);
    SR_IN_L : in std_logic;
    SR_IN_R : in std_logic;
    SR_OUT_L : out std_logic;
    SR_OUT_R : out std_logic
);
end UAL;

architecture UAL_DataFlow of UAL is 
	
    signal My_A : std_logic_vector (7 downto 0);
    signal My_B : std_logic_vector (7 downto 0);
    signal My_SR_IN_L : std_logic_vector (7 downto 0);
    signal My_SR_IN_R : std_logic_vector (7 downto 0);
    signal My_SR_OUT_L : std_logic;
    signal My_SR_OUT_R : std_logic;
    signal My_S : std_logic_vector (7 downto 0);
    signal My_sel_FCT : std_logic_vector (3 downto 0);

begin
	
    -- process explicite - intstructions séquentielle
    UALProc : process (sel_FCT)
    begin
      case sel_FCT is
      when "0000" =>
      	My_S (7 downto 0) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "0001" =>
        My_S (3 downto 0) <= A;
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "0010" =>
        My_S (3 downto 0) <= B;
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "0011" =>
        My_S (3 downto 0) <= not A;
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "0100" =>
        My_S (3 downto 0) <= not B;
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "0101" =>
        My_S (3 downto 0) <= A and B;
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "0110" =>
        My_S (3 downto 0) <= A or B;
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "0111" =>
        My_S (3 downto 0) <= A xor B;
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "1000" =>
        My_S(3) <= SR_IN_L;
        My_S(2 downto 0) <= A(3 downto 1);
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_R <= A(0);
      when "1001" =>
        My_S(0) <= SR_IN_R;
        My_S (3 downto 1) <= A(2 downto 0);
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= A(3);
      when "1010" =>
        My_S(3) <= SR_IN_L;
        My_S(2 downto 0) <= B(3 downto 1);
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_R <= B(0);
      when "1011" =>
        My_S(0) <= SR_IN_R;
        My_S (3 downto 1) <= B(2 downto 0);
        My_S (7 downto 4) <= (others => '0');
        My_SR_OUT_L <= B(3);
      when "1100" =>
        My_S <= My_A + My_B + My_SR_In_R;
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "1101" =>
      	My_S (7 downto 0)  <= (others => '0');
        My_S <= My_A + My_B;
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "1110" =>
      	My_S (7 downto 0)  <= (others => '0');
        My_S <= My_A - My_B;
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when "1111" =>
      	My_S (7 downto 0)  <= (others => '0');
        My_S <= My_A * My_B;
        My_SR_OUT_L <= '0';
        My_SR_OUT_R <= '0';
      when others => report "c'est cassé";
    end case;
    end process;
    My_A (3 downto 0) <= A;
    My_A (7 downto 4) <= (others => '0');
    My_B (3 downto 0) <= B;
    My_B (7 downto 4) <= (others => '0');
    My_SR_In_R(0) <= SR_In_R;
    My_SR_In_R (7 downto 1) <= (others => '0');
    My_SR_In_L(0) <= SR_In_R;
    My_SR_In_L (7 downto 1) <= (others => '0');
    
    S <= My_S;
    SR_OUT_L <= My_SR_OUT_L;
    SR_OUT_R <= My_SR_OUT_R;
    
end UAL_DataFlow;
