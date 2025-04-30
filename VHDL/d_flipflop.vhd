
-- The d flipflop
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- d flip flip with clear, preset and enable
entity d_flipflop is 
    port(
        clk     : in std_logic;     -- clock signal
        resetn  : in std_logic;     -- active low clear
        e       : in std_logic;      -- enable  
        d       : in std_logic_vector(3 downto 0); -- input data
        q3       : out std_logic_vector(3 downto 0) -- output data
    );
end entity d_flipflop;

architecture rtl of d_flipflop is
begin
    proc_dff : process(clk, resetn, e)
    begin
        if resetn = '0' then
            q3 <= (others => '0');
        elsif clk'event and clk = '1' then
            if e = '1' then
                q3 <= d;
            end if;
        end if;
    end process proc_dff;
end rtl;