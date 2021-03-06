-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity BuffersUAL is 
port (
    clock : in std_logic;
    reset : in std_logic;
    preset : in std_logic;
    
    Buffer_Memory1_IN : in std_logic_vector(7 downto 0);
    Buffer_Memory1_OUT : out std_logic_vector(7 downto 0);
    CE_Buffer_Memory1 : in std_logic;
    
    Buffer_Memory2_IN : in std_logic_vector(7 downto 0);
    Buffer_Memory2_OUT : out std_logic_vector(7 downto 0);
    CE_Buffer_Memory2 : in std_logic;
    
    Buffer_SR_IN_L_in : in std_logic;
    Buffer_SR_IN_L_OUT : out std_logic;
    CE_Buffer_SR_IN_L : in std_logic;
    
    Buffer_SR_IN_R_in : in std_logic;
    Buffer_SR_IN_R_out : out std_logic;
    CE_Buffer_SR_IN_R : in std_logic;
    
    Buffer_A_IN : in std_logic_vector(3 downto 0);
    Buffer_A_OUT : out std_logic_vector(3 downto 0);
    CE_Buffer_A : in std_logic;
    
    Buffer_B_IN : in std_logic_vector(3 downto 0);
    Buffer_B_OUT : out std_logic_vector(3 downto 0);
    CE_Buffer_B : in std_logic;
    
    Buffer_SEL_FCT_IN : in STD_LOGIC_VECTOR (3 downto 0);
    Buffer_SEL_FCT_OUT : out STD_LOGIC_VECTOR (3 downto 0);
    
    Buffer_SEL_OUT_IN : in STD_LOGIC_VECTOR (1 downto 0);
    Buffer_SEL_OUT_OUT : out STD_LOGIC_VECTOR (1 downto 0)
    );
end BuffersUAL;

architecture Buffers_DataFlow of BuffersUAL is

begin
    
    MyBuffer_AProc : process (preset, reset, clock, CE_Buffer_A)
    begin
        if (reset = '1') then
            Buffer_A_OUT <= (others => '0');
        elsif (rising_edge(clock) and CE_Buffer_A = '1') then
            if (preset = '1') then
                Buffer_A_OUT <= (others => '1');
            else
                Buffer_A_OUT <= Buffer_A_IN;
            end if;
        end if;
     end process;

    MyBuffer_BProc : process (preset, reset, clock, CE_Buffer_B)
     begin
         if (reset = '1') then
             Buffer_B_OUT <= (others => '0');
         elsif (rising_edge(clock) and CE_Buffer_B = '1') then
             if (preset = '1') then
                 Buffer_B_OUT <= (others => '1');
             else
                 Buffer_B_OUT <= Buffer_B_IN;
             end if;
         end if;
      end process;

      MyBuffer_SR_IN_LProc : process (preset, reset, clock, CE_Buffer_SR_IN_L)
      begin
          if (reset = '1') then
              Buffer_SR_IN_L_out <= '0';
          elsif (rising_edge(clock) and CE_Buffer_SR_IN_L = '1') then
              if (preset = '1') then
                  Buffer_SR_IN_L_out <= '1';
              else
                  Buffer_SR_IN_L_out <= Buffer_SR_IN_L_in;
              end if;
          end if;
       end process;

       MyBuffer_SR_IN_RProc : process (preset, reset, clock, CE_Buffer_SR_IN_R)
       begin
           if (reset = '1') then
               Buffer_SR_IN_R_out <= '0';
           elsif (rising_edge(clock) and CE_Buffer_SR_IN_R = '1') then
               if (preset = '1') then
                   Buffer_SR_IN_R_out <= '1';
               else
                   Buffer_SR_IN_R_out <= Buffer_SR_IN_R_in;
               end if;
           end if;
        end process;

        MyBuffer_Memory1Proc : process (preset, reset, clock, CE_Buffer_Memory1)
        begin
            if (reset = '1') then
                Buffer_Memory1_out <= (others => '0');
            elsif (rising_edge(clock) and CE_Buffer_Memory1 = '1') then
                if (preset = '1') then
                    Buffer_Memory1_out <= (others => '1');
                else
                    Buffer_Memory1_out <= Buffer_Memory1_in;
                end if;
            end if;
         end process;

         MyBuffer_Memory2Proc : process (preset, reset, clock, CE_Buffer_Memory2)
         begin
             if (reset = '1') then
                 Buffer_Memory2_out <= (others => '0');
             elsif (rising_edge(clock) and CE_Buffer_Memory2 = '1') then
                 if (preset = '1') then
                     Buffer_Memory2_out <= (others => '1');
                 else
                     Buffer_Memory2_out <= Buffer_Memory2_in;
                 end if;
             end if;
          end process;

          MyBuffer_SEL_FCTProc : process (preset, reset, clock, CE_Buffer_B)
          begin
              if (reset = '1') then
                  Buffer_SEL_FCT_OUT <= (others => '0');
              elsif (rising_edge(clock)) then
                  if (preset = '1') then
                      Buffer_SEL_FCT_OUT <= (others => '1');
                  else
                      Buffer_SEL_FCT_OUT <= Buffer_SEL_FCT_IN;
                  end if;
              end if;
           end process;

           MyBuffer_SEL_OUTProc : process (preset, reset, clock, CE_Buffer_B)
           begin
               if (reset = '1') then
                   Buffer_SEL_OUT_OUT <= (others => '0');
               elsif (rising_edge(clock)) then
                   if (preset = '1') then
                       Buffer_SEL_OUT_OUT <= (others => '1');
                   else
                       Buffer_SEL_OUT_OUT <= Buffer_SEL_OUT_IN;
                   end if;
               end if;
            end process;
 

end Buffers_DataFlow;