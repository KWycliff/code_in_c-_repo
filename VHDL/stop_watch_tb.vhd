
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.package_func.all;

entity stop_watch_tb is
end entity stop_watch_tb;

architecture beh of stop_watch_tb is
-- constants
constant sw_width_m10 : integer := 10;
constant sw_width_m6  : integer := 6;

-- inputs
signal pause    : std_logic := '0';
signal clk      : std_logic := '0';
signal resetn   : std_logic := '0';

--outputs
signal q1   : std_logic_vector(clog2(sw_width_m10)-1 downto 0);
signal q2   : std_logic_vector(clog2(sw_width_m10)-1 downto 0);
signal q3   : std_logic_vector(clog2(sw_width_m10)-1 downto 0);
signal q4   : std_logic_vector(clog2(sw_width_m6)-1 downto 0);

begin
-- instantiation
    stop_watch_i : entity work.stop_watch
        generic map(
            sw_width_m10 => sw_width_m10,
            sw_width_m6 => sw_width_m6
        )
        port map(
            clk     => clk,
            resetn  => resetn,
            pause   => pause,
            q1      => q1,
            q2      => q2,
            q3      => q3,
            q4      => q4            
        );

    -- clock generation
    clk <= not clk after 5 ns;

    -- input stimulus generation
    stimulus_process : process 
    begin 
        wait for 10 ns;
        resetn <= '1';
        pause  <= '0';
        wait;
    end process stimulus_process;
end beh;    