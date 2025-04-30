
library ieee;
use ieee.std_logic_1164.all;

entity mearly_fsm is 
    port(
        clk : in std_logic;
        resetn : in std_logic;
        x : in std_logic;
        z : out std_logic
    );
end entity mearly_fsm;

architecture rtl of mearly_fsm is
-- custom type to define the five different states
type state is(s1, s2, s3, s4, s5);
signal y : state;
begin
    transition_process : process(resetn, clk, x)
    begin
        if resetn = '0' then -- asynchronous reset
            y <= s1; -- initial state
        elsif(clk'event and clk = '1') then
            case y is
                when s1 =>
                    if x = '1' then
                        y <= s2;
                    else
                        y <= s1;
                    end if;
                when s2 =>
                    if x = '1' then
                        y <= s3;
                    else
                        y <= s1;
                    end if;
                when s3 =>
                    if x = '1' then
                        y <= s3;
                    else 
                        y <= s4;
                    end if;
                when s4 =>
                    if x = '1' then
                        y <= s5;
                    else
                        y <= s1;
                    end if;
                when s5 =>
                    if x = '1' then
                        y <= s3;
                    else
                        y <= s1;
                    end if;
            end case; 
        end if;
    end process transition_process;      
    
    output_process : process(x, y)
    begin
        z <= '0';
        case y is
            when s1 =>
            when s2 =>
            when s3 => 
            when s4 =>
            when s5 =>
                if x = '0' then
                    z <= '1';
                end if;
        end case;
    end process output_process;
end rtl;
