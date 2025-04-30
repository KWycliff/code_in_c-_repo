
-- DESCRIPTION
-- -----------
-- A test bench for the sr, jk and d flipflops
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity flipflop_tb is 
end entity flipflop_tb;

architecture beh of flipflop_tb is

--input signals
signal clk      : std_logic := '0';
signal s        : std_logic := '0';
signal r        : std_logic := '1';
signal j        : std_logic := '0';
signal k        : std_logic := '0';
signal resetn   : std_logic := '0';
signal e        : std_logic := '0';
signal d        : std_logic_vector(3 downto 0) := (others => '0');

-- output signals
signal q1       : std_logic := '0';
signal qn1      : std_logic := '0';
signal q2       : std_logic := '0';
signal q3       : std_logic_vector(3 downto 0) := (others => '0');

-- constants
constant T      : time := 10 ns;    -- period of the clock signal
constant dc     : real := 0.5;      -- duty cycle of 50%

begin
    flip_flop_top_i : entity work.flip_flop_top
        port map(
            clk     => clk,
            s       => s,
            r       => r,
            q1      => q1,
            qn1     => qn1,
            j       => j,
            k       => k,
            q2      => q2,
            resetn  => resetn,
            e       => e,
            d       => d,
            q3      => q3                        
        );

    clock_process : process
    begin
        clk <= '0';
        wait for (T-T*dc);
        clk <= '1';
        wait for (T*dc);
    end process clock_process;

    stimulus_process : process
    begin
        wait for 50 ns;
        s <= '1';
        r <= '0';
        j <= '1';
        k <= '1';
        resetn <= '1';
        e <= '1';
        d <= x"A";

        wait for 2*T;
        s <= '0';
        r <= '1';
        j <= '1';
        k <= '1';
        resetn <= '0';
        e <= '1';
        d <= x"A";

        wait for 2*T;
        s <= '0';
        r <= '0';
        j <= '1';
        k <= '1';
        resetn <= '1';
        e <= '1';
        d <= x"A";

        wait;
    end process stimulus_process;
end beh;    
