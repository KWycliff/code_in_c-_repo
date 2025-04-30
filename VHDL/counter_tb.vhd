
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.package_func.all;

entity counter_tb is 
end entity counter_tb;

architecture beh of counter_tb is
    
-- constants
constant N      : integer := 20;

-- input signals
signal clk      : std_logic := '0';
signal resetn   : std_logic := '0';
signal en       : std_logic := '0';

-- output signals
signal q_out      : std_logic_vector(clog2(N)-1 downto 0);
signal z          : std_logic;

begin
-- instantiation
    n_int_counter_i : entity work.n_int_counter
        generic map(N => N)
        port map(
            clk     => clk,
            resetn  => resetn,
            en      => en,
            z       => z,
            q_out   => q_out
        );

    -- clock generation
    clk <= not clk after 5 ns;

    -- input stimulus generation
    stimulus_process : process 
    begin
        wait for 10 ns;
        resetn <= '1';
        en     <= '1';
        
        wait for 100 ns;
        resetn <= '1';
        en     <= '1';
        wait for 5 ns;
        resetn <= '1';
        en     <= '1';
        wait for 100 ns;
        resetn <= '1';
        en     <= '0';                
        wait for 500 ns;
        wait;
    end process stimulus_process;
end beh;