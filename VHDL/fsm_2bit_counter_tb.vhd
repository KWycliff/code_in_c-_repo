
library ieee;
use ieee.std_logic_1164.all;

entity fsm_2bit_counter_tb is
end entity fsm_2bit_counter_tb;

architecture beh of fsm_2bit_counter_tb is
-- input signals
signal clk : std_logic := '0';
signal resetn : std_logic := '0';

-- output signal
signal q : std_logic_vector(1 downto 0);


begin

    -- clock congiguration
    clk <= not clk after 5 ns;

    stimulus_process : process
    begin
        wait for 10 ns;
        resetn <= '1';
        wait for 100 ns;
        resetn <= '0';
        wait for 10 ns;
        resetn <= '1';
        wait;
    end process stimulus_process;
    
-- instantiation
    fsm_2bit_counter_i : entity work.fsm_2bit_counter
        port map(
            clk => clk,
            resetn => resetn,
            q => q
        );
    
end beh;