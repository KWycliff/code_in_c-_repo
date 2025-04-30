
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_light_top is
    port(
        clk_in : in std_logic;
        sw     : in std_logic_vector(2 downto 0);
        led_out : out std_logic
    );
end entity;

architecture rtl of led_light_top is

    signal clk    : std_logic := '0';
    signal locked : std_logic := '0';
    signal reset  : std_logic := '0';

    component clock_gen is
        port(
            clk_in : in std_logic;
            clk_out    : out std_logic;
            locked    : out std_logic
        );
    end component;    
begin
    clk_inst : clock_gen 
    port map(
        clk_in => clk_in,
        clk_out    => clk,
        locked => locked
    );

    reset <= not locked;

    led_light_i : entity work.led_light
     port map(
        clk => clk,
        reset => reset,
        sw => sw,
        led_out => led_out
    );
end rtl;