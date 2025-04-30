
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_rtl is 
  port(
    clk : in std_logic;
    data_in : in std_logic_vector(3 downto 0);
    dat_out : out std_logic
  );
end entity;

architecture rtl of test_rtl is 

signal a        : std_logic := '0';
signal b        : std_logic := '0';
signal c        : std_logic := '0';
signal d        : std_logic := '0';
signal siga     : std_logic := '0';
signal sigb     : std_logic := '0';
signal sigc     : std_logic := '0';
signal out_i    : std_logic := '0';
signal sigc_reg : std_logic := '0';

begin 
  a <=data_in(0);
  b <=data_in(1);
  c <=data_in(2);
  d <=data_in(3);
  reg_proc : process(clk)
  begin 
    if clk'event and clk= '1' then 
      siga <= a and not b;
      sigb <= c and not d;
      sigc <= siga xor sigb;

      if sigc = '1' then
        out_i <= '1';
        sigc_reg <= sigc; 
      end if;

      if out_i = '1' then
        out_i <= '0';
        dat_out <= sigc_reg; 
      end if;
    end if;
  end process;
end rtl;