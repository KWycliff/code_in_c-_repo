
-- Binary to Gray decoder with case statement
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity gray_decoder is
    port(
        b_g     : in std_logic_vector(2 downto 0);
        g       : out std_logic_vector(2 downto 0)
    );
end entity;

architecture rtl of gray_decoder is 
begin
    process_gray : process(b_g)
    begin 
    case b_g is
        when "000"   =>
            g <= "000";
        when "001"   =>
            g <= "001";
        when "010"   =>
            g <= "011";
        when "011"   =>
            g <= "010";
        when "100"   =>
            g <= "110";
        when "101"   =>
            g <= "111";
        when "110"   =>
            g <= "101";
        when others  =>
            g <= "100";
    end case;
    end process;
end rtl;