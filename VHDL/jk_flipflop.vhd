
-- The jk flip flop
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
    port(
        clk : in std_logic;
        j   : in std_logic;
        k   : in std_logic;
        q2   : out std_logic -- jk output
        --qn2  : out std_logic; 
    );
end entity jk_flipflop;

architecture rtl of jk_flipflop is
signal qt2 : std_logic := '0';
--signal qtn : std_logic;

begin
    jk_process : process(clk)
    begin
        if (clk'event and clk = '1') then
            if j = '1' and k = '1' then
                qt2 <= not(qt2);
            elsif j = '1' and k = '0' then
                qt2 <= '0';
            elsif j = '0' and k = '1' then
                qt2 <= '1';
            end if;
        end if;
    end process jk_process;
q2 <= qt2;

end rtl;