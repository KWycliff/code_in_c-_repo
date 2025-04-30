
-- DESCRIPTION
-- -----------
-- Binary to Gray decoder with case statement test bench
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity gray_decoder_tb is
end entity;

architecture beh of gray_decoder_tb is
    component gray_decoder
        port(
            b_g     : in std_logic_vector(2 downto 0);
            g       : out std_logic_vector(2 downto 0)
        );
    end component;

    -- input
    signal b_g : std_logic_vector(2 downto 0);
    
    -- output
    signal g : std_logic_vector(2 downto 0);

    begin
        -- instantiation which is assigning the signal values in the tb architecture to the component
        gray_decoder_i : gray_decoder
            port map(
                b_g => b_g,
                g => g
            );
        -- stimulus generation process 
        stimilus_proc : process
            begin
                b_g <= "000"; 
                wait for 50 ns;
                b_g <= "001";

                wait for 50 ns;
                b_g <= "010";

                wait for 50 ns;
                b_g <= "011";

                wait for 50 ns;
                b_g <= "100";

                wait for 50 ns;
                b_g <= "101";

                wait for 50 ns;
                b_g <= "110";

                wait for 50 ns;
                b_g <= "111";

                wait;
            end process;
end beh;
