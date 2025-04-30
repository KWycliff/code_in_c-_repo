
-- A configurable lights' pattern generator
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity lights_pattern is 
    port(
        sel     : in std_logic_vector(1 downto 0);  --This selects the desired pattern
        --x     : in std_logic_vector(1 downto 0);  --selects the rate at which the lights pattern change
        --stop  : in std_logic;    -- this freezes the pattern   
        resetn  : in std_logic;
        clk     : in std_logic;
        eg      : out std_logic;
        seg     : out std_logic_vector(7 downto 0) -- this is the output that goes to the sevenseg 
    );
end entity lights_pattern;

architecture rtl of lights_pattern is
type state is (s1,s2a, s3a, s4a, s5a, s6a, s7a, s8a, s2b, s3b, s4b, s2c, s3c, s4c, s2d, s3d, s4d, s5d, s6d);
signal y : state;
signal en : std_logic := '0'; -- from the counters through the mux
signal dseg : std_logic_vector(7 downto 0);
signal esg : std_logic;
--signal stop : std_logic; 
--signal sel : std_logic_vector(1 downto 0);
begin
    transition_process : process(resetn, clk)
    begin
        if resetn = '0' then
            y <= s1;
            dseg <= (others => '0');
            esg <= '0';
        elsif(clk'event and clk = '1') then
            dseg <= (others => '0');
            esg <= '0';
            case y is
                when s1 =>
                    if en = '1' then
                        if sel = "00" then
                            y <= s2a;
                            dseg <= "00000111";
                            esg <= '1';
                        elsif sel = "01" then
                            y <= s2b;
                            dseg <= "00000101";
                            esg <= '1';
                        elsif sel = "10" then
                            y <= s2c;
                            dseg <= "00010001";
                            esg <= '1';
                        elsif sel = "11" then
                            y <= s2d;
                            dseg <= "00110011";
                            esg <= '1';
                        --else
                            --y <= '-';
                            --dseg <= "--------";
                            --esg <= '-';
                        end if;
                    else
                        y <= s1;
                    end if;

                when s2a =>
                    if en = '1' then
                        y <= s3a;
                        dseg <= "00001110";
                        esg <= '1';
                    else
                        y <= s2a;
                    end if;

                when s3a =>
                    if en = '1' then
                        y <= s4a;
                        dseg <= "00011100";
                        esg <= '1';
                    else
                        y <= s3a;
                    end if;

                when s4a =>
                    if en = '1' then
                        y <= s5a;
                        dseg <= "00111000";
                        esg <= '1';
                    else
                        y <= s4a;
                    end if;
                
                when s5a =>
                    if en = '1' then
                        y <= s6a;
                        dseg <= "01110000";
                        esg <= '1';
                    else
                        y <= s5a;
                        end if;

                when s6a =>
                    if en = '1' then
                        y <= s7a;
                        dseg <= "11100000";
                        esg <= '1';
                    else
                        y <= s6a;
                    end if;

                when s7a =>
                    if en = '1' then
                        y <= s8a;
                        dseg <= "11000001";
                        esg <= '1';
                    else
                        y <= s7a;
                    end if;

                when s8a =>
                    if en = '1' then
                        y <= s1;
                        dseg <= "10000011";
                        esg <= '1';
                    else
                        y <= s8a;
                    end if;

                when s2b =>
                    if en = '1' then
                        y <= s3b;
                        dseg <= "00010100";
                        esg <= '1';
                    else
                        y <= s2b;
                    end if;

                when s3b =>
                    if en = '1' then
                        y <= s4b;
                        dseg <= "01010000";
                        esg <= '1';
                    else
                        y <= s3b;
                    end if;
                when s4b =>
                    if en = '1' then
                        y <= s1;
                        dseg <= "01000001";
                        esg <= '1';
                    else
                        y <= s4b;
                    end if;
                when s2c =>
                    if en = '1' then
                        y <= s3c;
                        dseg <= "00100010";
                        esg <= '1';
                    else 
                        y <= s2c;
                    end if;
                when s3c =>
                    if en = '1' then
                        y <= s4c;
                        dseg <= "01000100";
                        esg <= '1';
                    else
                        y <= s3c;
                    end if;
                when s4c =>
                    if en = '1' then
                        y <= s1;
                        dseg <= "10001000";
                        esg <= '1';
                    else
                        y <= s4c;
                    end if;
                when s2d =>
                    if en = '1' then
                        y <= s3d;
                        dseg <= "11100111";
                        esg <= '1';
                    else
                        y <= s2d;
                    end if;
                when s3d =>
                    if en = '1' then
                        y <= s4d;
                        dseg <= "11001100";
                        esg <= '1';
                    else 
                        y <= s3d;
                    end if;
                when s4d =>
                    if en = '1' then
                        y <= s5d;
                        dseg <= "11111001";
                        esg <= '1';
                    else
                        y <= s4d;
                    end if;
                when s5d =>
                    if en = '1' then
                        y <= s6d;
                        dseg <= "10000111";
                        esg <= '1';
                    else
                        y <= s5d;
                    end if;
                when s6d =>
                    if en = '1' then
                        y <= s1;
                        dseg <= "01111000";
                        esg <= '1';
                    else
                        y <= s6d;
                    end if;
            end case;
        end if;
    end process transition_process;
    seg <= dseg;
    eg <= esg;

-- instantiation
modulo_5_counter_i : entity work.n_int_counter
                        generic map( N => 5)
                        port map(
                            clk     => clk,
                            resetn  => resetn,
                            en      => '1',
                            z       => en                           
                        );
end rtl;

                
                        