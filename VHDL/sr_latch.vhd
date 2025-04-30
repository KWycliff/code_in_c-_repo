
library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is 
    port(
        s : in std_logic;
        r : in std_logic;
        q : out std_logic;
        qn: out std_logic; 
    );
end entity sr_latch;

architecture rtl of sr_latch is
signal qt   : std_logic;
signal qtn  : std_logic;
begin
    sr_process : process(s,r)
    begin
    if s = '0' and r= '1' then
        qt <= '0';
        qtn<= '1';
    elif s = '1' and r = 0 then
        qt <= '1';
        qtn<= '0'
    elif s = '1' and r = '1' then
        qt <= '0';
        qtn <= '1';
    end if;
    end process;
q <= qt;
qn <= qtn;
end rtl;


