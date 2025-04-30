
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity count_bits_vu_tb is
    generic (runner_cfg : string);
end entity;

architecture beh of count_bits_vu_tb is
signal clk : std_logic := '0';
signal data_in : std_logic_vector(3 downto 0) := (others=>'0');
signal bit_count : std_logic_vector(2 downto 0) := (others=>'0');

    begin
        clk <= not clk after 25 ns;

        main_tc_proc : process
        variable dat_in_test : std_logic_vector(3 downto 0);
        variable exp_bit_count : std_logic_vector(2 downto 0);
        begin
            test_runner_setup(runner, runner_cfg);

            while test_suite loop
                if run("test_1") then 
                    dat_in_test := "0000";
                    exp_bit_count := "100";
                    data_in <= dat_in_test;
                    wait until clk'event and clk='1';
                    wait until clk'event and clk='1';
                    check_equal(bit_count,exp_bit_count);
                elsif run("test_2") then 
                    dat_in_test := "0001";
                    exp_bit_count := "011";
                    data_in <= dat_in_test;
                    wait until clk'event and clk='1';
                    wait until clk'event and clk='1';
                    check_equal(bit_count,exp_bit_count);
                elsif run("test_3") then
                    dat_in_test := "1111";
                    exp_bit_count := "000";
                    data_in <= dat_in_test;
                    wait until clk'event and clk='1';
                    wait until clk'event and clk='1';
                    check_equal(bit_count,exp_bit_count); 
                end if;
            end loop;
            test_runner_cleanup(runner); 
        end process;

        count_bits_inst: entity work.count_bits
         port map(
            clk => clk,
            data_in => data_in,
            bit_count => bit_count
        );

end beh;