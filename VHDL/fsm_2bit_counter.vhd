
library ieee;
use ieee.std_logic_1164.all;

entity fsm_2bit_counter is 
    port(
        clk : in std_logic;
        resetn : in std_logic;
        q : out std_logic_vector(1 downto 0)
    );
end entity fsm_2bit_counter;

architecture rtl of fsm_2bit_counter is
-- custom data type definition
type state is (s1, s2, s3, s4);
signal y : state; -- definition of signal y of type "state"

begin
    transition_process : process(resetn, clk)
    begin
        if resetn = '0' then
            y <= s1; -- go to the initial state when resetn is '0'
        elsif(clk'event and clk = '1') then
            case y is 
                when s1 =>
                    y <= s2;
                when s2 =>
                    y <= s3;
                when s3 =>
                    y <= s4;
                when s4 =>
                    y <= s1;
            end case;
        end if;
    end process transition_process;

    output_process : process(y)
    begin
        case y is
            when s1 =>
                q <= "00";
            when s2 =>
                q <= "01";
            when s3 =>
                q <= "10";
            when s4 =>
                q <= "11";
        end case;
    end process output_process;
end rtl;
