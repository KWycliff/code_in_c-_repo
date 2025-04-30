
library ieee;
use ieee.std_logic_1164.all;

entity count_reg_fsm_v2_tb is
end entity count_reg_fsm_v2_tb;

architecture beh of count_reg_fsm_v2_tb is
-- inputs
signal clk     : std_logic := '0';
signal resetn  : std_logic := '0';
signal d       : std_logic_vector(3 downto 0) := (others => '0');
signal s       : std_logic_vector(3 downto 0) := (others => '0');

--outputs
signal qd      : std_logic_vector(3 downto 0);
signal qs      : std_logic_vector(3 downto 0);
signal sclk    : std_logic;   

begin
-- instantiation
    count_reg_fsm_i : entity work.count_reg_fsm_v2
        port map(
            clk    =>  clk,
            resetn =>  resetn,
            d      =>  d,
            s      =>  s,
            qd     =>  qd,
            qs     =>  qs,
            sclk   =>  sclk
        );
 -- clock generation
     clk <= not clk after 5 ns;   
     
-- input stimulus generation
    stimulus_process : process
    begin
        resetn <= '0';
        wait for 5 ns;
        resetn <= '1';
        d <= "1100";
        s <= "0110";
        wait for 20 ns;
        resetn <= '1';
        d <= "0101";
        s <= "1101";
        wait for 60 ns;
        resetn <= '1';
        d <= "1001";
        s <= "1001";
        wait for 20 ns;
        resetn <= '1';
        d <= "0101";
        s <= "1100";
        wait for 20 ns;
        resetn <= '1';
        d <= "1011";
        s <= "0111";
        wait;
    end process stimulus_process;
end beh;



