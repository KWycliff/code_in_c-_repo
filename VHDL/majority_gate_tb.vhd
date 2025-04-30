
-- Majority Gate
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity majority_gate_tb is
end entity majority_gate_tb;

architecture rtl of majority_gate_tb is
    
    -- constants
    constant N : integer := 8;
     
    -- input signals
    signal a : std_logic_vector(N-1 downto 0) := x"00";
    signal b : std_logic_vector(N-1 downto 0) := (others => '0');
    signal c : std_logic_vector(N-1 downto 0) := (others => '0');
    signal a_a : std_logic_vector(N-1 downto 0) := (others => '0');
    signal b_b : std_logic_vector(N-1 downto 0) := (others => '0');

    -- output signals
    signal f : std_logic_vector(N-1 downto 0);
    signal y_err : std_logic;
    signal r : std_logic_vector(N-1 downto 0);
    
    begin
    top_level_i : entity work.top_level
        port map(
            a     => a,
            b     => b,
            c     => c,
            f     => f,
            y_err => y_err,
            a_a   => a_a,
            b_b   => b_b,
            r     => r
        );

    stimulus : process
        begin
            wait for 50 ns;
            a <= x"00";
            b <= x"00";
            c <= x"00";
            a_a <= x"23";
            b_b <= x"34";

            wait for 50 ns;
            a <= x"32";
            b <= x"23";
            c <= x"12";
            a_a <= x"10";
            b_b <= x"10";

            wait for 50 ns;
            a <= x"42";
            b <= x"24";
            c <= x"42";
            a_a <= x"A3";
            b_b <= x"56";

            wait for 50 ns;
            a <= x"A3";
            b <= x"3E";
            c <= x"F1";
            a_a <= x"F3";
            b_b <= x"E2";

            wait;
    end process;
end rtl;            