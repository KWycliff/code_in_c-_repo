
library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_top_tb is 
end entity shift_reg_top_tb;

architecture beh of shift_reg_top_tb is 
--input signals
signal clk      : std_logic := '0';
signal resetn   : std_logic := '0';
signal d        : std_logic_vector(3 downto 0) := (others => '0');
signal e        : std_logic := '0';
signal s_l      : std_logic := '0';
signal din      : std_logic := '0';

--output signals
signal dout     : std_logic;
signal q        : std_logic_vector(3 downto 0);
signal dout1    : std_logic;
signal q1       : std_logic_vector(3 downto 0);

begin
    --instantiation
    shift_reg_top_i : entity work.shift_reg_top
        port map(
            clk     => clk,
            resetn  => resetn,
            d       => d,
            e       => e,
            s_l     => s_l,
            din     => din,
            dout    => dout,
            q       => q,
            dout1   => dout1,
            q1      => q1               
        );
    --clock gen    
    clk <= not clk after 5 ns;

    -- stimulus gen process
    stimulus_process : process
    begin
        wait for 50 ns;
        resetn  <= '1';
        e       <= '1';
        d       <= x"F";
        s_l     <= '1';
        din     <= '0';

        wait for 100 ns;
        resetn  <= '0';
        e       <= '1';
        d       <= x"F";
        s_l     <= '0';
        din     <= '1';

        wait for 20 ns;
        resetn  <= '1';
        e       <= '1';
        d       <= x"F";
        s_l     <= '0';
        din     <= '1';

        wait for 20 ns;
        resetn  <= '1';
        e       <= '1';
        d       <= x"F";
        s_l     <= '0';
        din     <= '1';

        wait;
    end process stimulus_process;
end beh;



