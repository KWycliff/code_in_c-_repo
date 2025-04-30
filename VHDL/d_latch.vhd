
library ieee;
use ieee.std_logic_1164.all;

-- this is a d latch with an enable signal
entity d_latch is
    port(
        d : in std_logic;
        e : in std_logic;
        q : out std_logic;       
    );
end entity d_latch;

architecture rtl of d_latch is
signal qt : std_logic;
begin
    d_latch_proc : process(e,d)
    begin
        if e = '1' then
            qt <= d;
        end if;
    end process;
    q <= qt;
end rtl;
