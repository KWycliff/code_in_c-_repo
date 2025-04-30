
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_light_tb is
end entity;

architecture beh of led_light_tb is
    constant clk_period : time := 83.3333 ns;
    signal clk          : std_logic := '0';
    signal locked          : std_logic := '0';
    signal clk_in       : std_logic := '0';
    signal sw           : std_logic_vector(2 downto 0) := (others=>'0');
    signal led_out      : std_logic := '0';

    component clock_gen is
        port(
            clk_in : in std_logic;
            clk_out    : out std_logic;
            locked    : out std_logic
        );
    end component;    
begin
    
    clk_in <= not clk_in after (41.66667 ns);
     
    stim_process : process
    begin
        wait for 20 ns;
        sw <= "001";
        wait for 50 ns;
        sw <= "010";
        wait for 50 ns ;
        sw <= "100";
        wait for 25 ns;
        wait for 25 ns;
        sw <= "001";
        wait for 400 us;
        sw <= "011";
        wait;
    end process;

    clk_inst : clock_gen 
    port map(
        clk_in => clk_in,
        clk_out    => clk,
        locked => locked
    );    

    led_light_i : entity work.led_light_top
     port map(
        clk_in      => clk_in,
        sw       => sw,
        led_out  => led_out
    );
end beh;