
library ieee;
use ieee.std_logic_1164.all;

entity mearly_fsm_tb is
end entity mearly_fsm_tb;

architecture beh of mearly_fsm_tb is
-- input signals
signal clk      : std_logic := '0';
signal resetn   : std_logic := '0';
signal x        : std_logic := '0';

-- output signals
signal z        : std_logic;

begin
    -- instantiation
        n_int_counter_i : entity work.mearly_fsm
            port map(
                clk     => clk,
                resetn  => resetn,
                x       => x,
                z       => z
            );
    
        -- clock generation
        clk <= not clk after 5 ns;
    
        -- input stimulus generation
        stimulus_process : process 
        begin
            wait for 10 ns;
            resetn <= '1';
            x <= '1';
            wait for 10 ns;
            resetn <= '1';
            x <= '1';
            wait for 10 ns;
            resetn <= '1';
            x <= '0';
            wait for 10 ns;
            resetn <= '1';
            x <= '1';
            wait for 10 ns;
            resetn <= '1';
            x <= '0';
            wait for 10 ns;
            resetn <= '1';
            x <= '1';
            wait for 10 ns;
            resetn <= '1';
            x <= '0';
            wait for 10 ns;
            resetn <= '1';
            x <= '1';
            wait for 10 ns;
            resetn <= '1';
            x <= '0';
            wait;
        end process stimulus_process;
    end beh;