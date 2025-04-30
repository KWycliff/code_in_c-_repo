
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity mult_vunit_tb is
end entity;

architecture beh of mult_vunit_tb is
  constant period : time := 10 ns; 
  constant Na     : natural := 8;
  constant Nb     : natural := 8;
  signal clk      : std_logic := '0';
  signal multa    : std_logic_vector(Na-1 downto 0)  := (others => '0');   
  signal multb    : std_logic_vector(Nb-1 downto 0) := (others => '0');  
  signal mult_res : std_logic_vector() := (others => '0');
begin
   clk <= not clk after (period/2) ;
  
   test_process : process
   variable := mu
   begin
    test_runner_setup(runner, runner_cfg);

    while test_suite loop
      if run("test_one") then
      
      elsif run("test_two") then
      
      elsif run("test_three") then

      elsif run("test_four") then
      end if;
    end loop;
   end process;

   mult_instance : entity work.unsigned_signed_multiply
   generic map(
    Na  => 8, 
    Nb  => 8,
    rep => "unsigned"
   )
   port map(
    clk  => clk,
    a    => mutlta,
    b    => multb,
    p    => mult_res
   );
end beh;