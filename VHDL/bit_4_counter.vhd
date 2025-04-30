
library ieee;
use ieee.std_logic_1164.all;

entity bit_4_counter is 
    port(
        clk     : in std_logic;
        resetn  : in std_logic;
        q       : out integer range 0 to 15
    );
end entity bit_4_counter;

architecture rtl of bit_4_counter is
signal qt : integer range 0 to 15;
begin
    count_process : process(resetn, clk)
    begin
        if resetn = '0' then
            qt <= 0;
        elsif(clk'event and clk = '1') then
            qt <= qt + 1;
        end if;
    end process count_process;
q <= qt;
end rtl; 
