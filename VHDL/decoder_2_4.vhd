
-- -----------
-- A 2 to 4 decoder using the case statement
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity decoder_2_4 is
    port(
        a_d : in std_logic_vector(1 downto 0);
        en  : in std_logic;
        b_d : out std_logic_vector(3 downto 0)
    );
end entity decoder_2_4;

architecture rtl of decoder_2_4 is
    begin
        decoder_proc : process(en, a_d)
        begin
            if en = '0' then
                b_d <= "0000";
            else
                case a_d is
                    when "00" =>
                        b_d <= "0001";
                    when "01" =>
                        b_d <= "0010";
                    when "10" =>
                        b_d <= "0100";
                    when "11" =>
                        b_d <= "1000";
                    when others =>
                        b_d <= "----";
                end case;
            end if;
        end process decoder_proc;
 end rtl;                
                    
                    