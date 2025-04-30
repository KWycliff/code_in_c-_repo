
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_review_tb is
end entity counter_review_tb;

architecture beh of counter_review_tb is
signal clk : std_logic := '0';
signal rstn : std_logic := '0';
signal count_out : std_logic_vector(3 downto 0) := (others=>'0');

    begin
        --generate the clock signal
        clk <= not clk after 50 ns; -- 20MHz 
        rstn <= '1';--not rstn after 500 ns; -- the module is reset for the 1st 500 ns

        counter_review_inst: entity work.counter_review
         port map(
            clk => clk,
            rstn => rstn,
            count_out => count_out
        );
    end beh;