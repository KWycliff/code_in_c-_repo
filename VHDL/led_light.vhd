
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity led_light is
    port(
        clk     : in std_logic;
        reset   : in std_logic;
        sw      : in std_logic_vector(2 downto 0);
        led_out : out std_logic
    );
end entity;

architecture rtl of led_light is
signal led_i : std_logic := '0';
signal sw_i0 : std_logic_vector(2 downto 0) := (others=>'0');
signal sw_i1 : std_logic_vector(2 downto 0) := (others=>'0');
begin
    led_out <= led_i;
    reg_process : process(clk)
    begin
        if clk'event and clk='1' then
            sw_i0 <= sw;
            sw_i1 <= sw_i0;
        end if;
    end process;
    process_led_light : process(clk)
    begin
        if clk'event and clk='1' then
            if reset = '1' then
                led_i <= '0';
            else
                if sw_i1 = "001" then
                    led_i <= '1';
                elsif sw_i1 = "100" then
                    led_i <= '1';
                else
                    led_i <= '0';
                end if;
            end if;
        end if;
    end process;
end rtl;