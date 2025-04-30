
-- -----------
-- A top level file for the sr, jk and d flip flops
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity flip_flop_top is 
    port(
        clk     : in std_logic;
        s       : in std_logic;
        r       : in std_logic;
        q1      : out std_logic; -- sr output
        qn1     : out std_logic;  -- sr inverted output
        j       : in std_logic;
        k       : in std_logic;
        q2      : out std_logic; -- jk output
        resetn  : in std_logic;     -- active low clear
        e       : in std_logic;      -- enable  
        d       : in std_logic_vector(3 downto 0); -- input data
        q3      : out std_logic_vector(3 downto 0) -- output data                
    );
end entity flip_flop_top;

architecture rtl of flip_flop_top is 
begin
    -- sr flipflop instantiation
    sr_flipflop_i : entity work.sr_flipflop
        port map(
            clk => clk,
            s   => s,
            r   => r,
            q1  => q1,
            qn1 => qn1
        );

    -- jk flip flop instantiation
    jk_flipflop_i : entity work.jk_flipflop
        port map(
            clk => clk,
            j   => j,
            k   => k,
            q2  => q2
        );
    
    -- d flip flop instantiation
    d_flipflop_i : entity work.d_flipflop
        port map(
            clk     => clk,
            resetn  => resetn,
            e       => e,
            d       => d,
            q3      => q3
        );
end rtl;