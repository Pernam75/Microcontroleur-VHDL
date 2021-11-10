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
    SR_OUT_L : out std_logic;
    SR_OUT_R : out std_logic;
);
end UAL;

architecture UAL_DataFlow of UAL is 
    
begin
	
    -- process explicite - intstructions séquentielle
    UALProc : process (sel_FCT, A, B)
    begin
      case Sel_FCT is
      when '0000' =>
      	S (7 downto 0) <= (others => '0');
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '0001' =>
      	S (3 downto 0) <= A;
        S (7 downto 4) <= (others => '0')
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '0010' =>
      	S (3 downto 0) <= B;
        S (7 downto 4) <= (others => '0')
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '0011' =>
      	S (3 downto 0) <= not A;
        S (7 downto 4) <= (others => '0')
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '0100' =>
      	S (3 downto 0) <= not B;
        S (7 downto 4) <= (others => '0')
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '0101' =>
      	S (3 downto 0) <= A and B;
        S (7 downto 4) <= (others => '0')
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '0110' =>
      	S (3 downto 0) <= A or B;
        S (7 downto 4) <= (others => '0')
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '0111' =>
      	S (3 downto 0) <= A xor B;
        S (7 downto 4) <= (others => '0')
        SR_OUT_L <= '0';
        SR_OUT_R <= '0';
      when '1000' =>
      	S (2 downto 0) <= A;
        S (7 downto 3) <= (others => '0')
        SR_OUT_L <= A(downto 0);
        SR_OUT_R <= '0';
      when '1001' =>
      	S (2 downto 0) <= A;
        S (7 downto 3) <= (others => '0')
        SR_OUT_L <= A(downto 0);
        SR_OUT_R <= '0';
      when '1010' =>
      
      when '1011' =>
      
      when '1100' =>
      
      when '1101' =>
      
      when '1110' =>
      
      when '1111' =>
      
    end process;
    
end UAL_DataFlow;
