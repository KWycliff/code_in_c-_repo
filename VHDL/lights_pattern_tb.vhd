
library ieee;
use ieee.std_logic_1164.all;

entity lights_pattern_tb is
end entity lights_pattern_tb;

architecture beh of lights_pattern_tb is
--inputs
signal clk     : std_logic := '0';
signal resetn  : std_logic := '0';
signal sel     : std_logic_vector(1 downto 0) := (others => '0');

--outputs
signal eg : std_logic;
signal seg : std_logic_vector(7 downto 0);

begin
--instantiation
    lights_pattern_i : entity work.lights_pattern
        port map(
            sel    => sel,
            resetn => resetn,
            clk    => clk,
            eg     => eg,
            seg    => seg           
        );

-- clock generation
    clk <= not clk after 5 ns;

-- input stimulus generation
    stimulus_process : process
    begin
        resetn <= '0';
        wait for 5ns;
        resetn <= '1';
        sel <= "00";
        wait for 400 ns;
        resetn <= '1';
        sel <= "01";
        wait for 500 ns;
        resetn <= '1';
        sel <= "10";
        wait for 500 ns;
        resetn <= '1';
        sel <= "11";
        wait;
    end process stimulus_process;
end beh;
