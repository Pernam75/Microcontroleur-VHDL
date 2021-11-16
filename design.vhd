-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity TP_Coeur is
port (
  	A: in STD_LOGIC_VECTOR (3 downto 0);
  	B: in STD_LOGIC_VECTOR (3 downto 0);
  	SR_IN_L : in STD_LOGIC;
  	SR_IN_R : in STD_LOGIC;
  	SR_OUT_R : out STD_LOGIC;
  	SR_OUT_L : out STD_LOGIC;
  	S : out STD_LOGIC_VECTOR (7 downto 0);
  	SEL_FCT : in STD_LOGIC_VECTOR(3 downto 0));
end TP_Coeur;

architecture TP_Arch_Coeur of TP_UAL_Coeur is
    signal My_A, My_B, My_SEL_FCT : std_logic_vector (3 downto 0);
    signal My_SR_IN_L, My_SR_IN_R, My_SR_OUT_R, My_SR_OUT_L : std_logic;
    signal My_S : std_logic_vector (7 downto 0);
    

    
    
begin

	UAL_Process : process (A, B, SR_IN_L, SR_IN_R, SEL_FCT)
    variable My_A_VAR, My_B_VAR, My_S_VAR: std_logic_vector (7 downto 0);
    
    
    begin
      case SEL_FCT is
          when "0000" => 
              S <= 0;
              SR_OUT_L <= '0';
              SR_OUT_R <= '0';
              S(7 downto 0) <= (others => '0');
          when "0001" =>
              S(7 downto 4) <= (others => '0');
              S(3 downto 0) <= A;
              SR_OUT_L <= '0' ;
              SR_OUT_R <= '0' ;
          when "0010" =>
              S(7 downto 4) <= (others => '0');
              S(3 downto 0) <= B;
              SR_OUT_L <= '0' ;
              SR_OUT_R <= '0' ;
          when "0011" =>
              S(7 downto 4) <= (others => '0');
              S(3 downto 0) <= not A;
              SR_OUT_L <= '0' ;
              SR_OUT_R <= '0' ;
          when "0100" =>
              S(7 downto 4) <= (others => '0');
              S(3 downto 0) <= not B;
              SR_OUT_L <= '0' ;
              SR_OUT_R <= '0' ;
          when "0101" =>
              S(7 downto 4) <= (others => '0');
              S(3 downto 0) <= A and B;
              SR_OUT_L <= '0' ;
              SR_OUT_R <= '0' ;
          when "0110" =>
              S(7 downto 4) <= (others => '0');
              S(3 downto 0) <= A or B;
              SR_OUT_L <= '0' ;
              SR_OUT_R <= '0' ;
          when "0111" =>
              S(7 downto 4) <= (others => '0');
              S(3 downto 0) <= A xor B;
              SR_OUT_L <= '0' ;
              SR_OUT_R <= '0' ;
          when "1000" =>
              S(3) <= SR_IN_L ;
              S(2 downto 0) <= A(3 downto 1) ;
              S(7 downto 4) <= (others => '0') ;
              SR_OUT_R <= A(0) ;
          when "1001" =>
              S(0) <= SR_IN_R ;
              S (3 downto 1) <= A(2 downto 0);
              S (7 downto 4) <= (others => '0');
              SR_OUT_L <= A(3);
          when "1010" =>
              S(3) <= SR_IN_L ;
              S(2 downto 0) <= B(3 downto 1) ;
              S(7 downto 4) <= (others => '0') ;
              SR_OUT_R <= B(0) ;
          when "1011" =>
              S(0) <= SR_IN_R ;
              S (3 downto 1) <= B(2 downto 0);
              S (7 downto 4) <= (others => '0');
              SR_OUT_L <= B(3);
          when "1100" =>
              My_A_VAR(3 downto 0) <= A;
          	  My_B_VAR(3 downto 0) <= B;
              My_S_VAR <= My_A_VAR + My_B_VAR ;
              My_S_VAR <= My_A_VAR + ("0000000" & SR_IN_R) ;
              S <= My_S_VAR ;
              SR_OUT_L <= '0';
              SR_OUT_R <= '0';
          when "1101" =>
              My_A_VAR(3 downto 0) <= A;
              My_B_VAR(3 downto 0) <= B;
              My_A_VAR(7 downto 4) <= (others => A(3));
              My_B_VAR(7 downto 4) <= (others => B(3));
              My_S_VAR <= My_A_VAR + My_B_VAR ;
              S <= My_S_VAR ;
              SR_OUT_L <= '0';
              SR_OUT_R <= '0';
          when "1110" =>
              My_A_VAR(3 downto 0) <= A;
              My_B_VAR(3 downto 0) <= B;
              My_A_VAR(7 downto 4) <= (others => A(3));
              My_B_VAR(7 downto 4) <= (others => B(3));
              My_S_VAR <= My_A_VAR - My_B_VAR ;
              S <= My_S_VAR ;
              SR_OUT_L <= '0';
              SR_OUT_R <= '0';
          when "1111" =>
              S <= A * B;
              SR_OUT_L <= '0';
              SR_OUT_R <= '0';

         end case;
       
end process;


end;
            
            
     
