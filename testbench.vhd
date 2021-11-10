-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


entity testTP_Coeur is 

end testTP_Coeur;


architecture testTPCoeur_Arch of testTP_Coeur is
  
  	component TP_Coeur is
  		port (
      		A: in STD_LOIGIC_VECTOR (3 downto 0);
      		B: in STD_LOGIC_VECTOR (3 downto 0);
            SR_IN_L : in STD_LOGIC;
            SR_IN_R : in STD_LOGIC;
            SR_OUT_R : in STD_LOGIC;
            SR_OUT_L : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR (7 downto 0);
            SEL_FCT : in STD_LOGIC_VECTOR(3 downto 0));
	end TP_Coeur;
