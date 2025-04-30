
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg_tb is
end entity;

architecture beh of seven_seg_tb is
    signal clk_period : time := 83.3333 ns;
    signal clk_in   : std_logic := '0';
    signal sevenseg : std_logic_vector(6 downto 0) := (others => '0');
begin
    clk_in <= not clk_in after (clk_period/2);

    seven_seg_top_i : entity work.seven_seg_top 
        port map(
            clk_in      => clk_in,     
            sevenseg => sevenseg
        );
end beh;