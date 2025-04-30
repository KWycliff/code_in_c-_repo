
-- The sr flip flop
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- sr_flipflop with an enable signal
entity sr_flipflop is
    port(
        clk : in std_logic;
        s   : in std_logic;
        r   : in std_logic;
        q1   : out std_logic; -- sr output
        qn1  : out std_logic  -- sr inverted output
    );
end entity sr_flipflop;

architecture rtl of sr_flipflop is
signal qt1 : std_logic;
signal qtn1 : std_logic;

begin
    sr_process : process(clk, s, r)
    begin
        if (clk'event and clk = '1') then
            if s = '0' and r = '1' then 
                qt1 <= '0';
                qtn1 <= '1';
            elsif s = '1' and r = '0' then
                qt1 <= '1';
                qtn1 <= '0';
            elsif s = '1' and r = '1' then
                qt1 <= '0';
                qtn1 <= '0';
            end if;
        end if;
    end process sr_process;
q1 <= qt1;
qn1 <= qtn1;    
end rtl;