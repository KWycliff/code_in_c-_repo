
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unsigned_signed_multiply is
  generic(
    Na : integer := 4;
    Nb : integer := 4;
    rep : string := "signed"
  );
  port(
    clk : in std_logic;
    a   : in std_logic_vector(Na-1 downto 0);
    b   : in std_logic_vector(Nb-1 downto 0);
    p   : out std_logic_vector(Na+Nb-1 downto 0)
  );
end entity unsigned_signed_multiply;

architecture rtl of unsigned_signed_multiply is
begin
  fa : if rep = "unsigned" generate
    unsigned_mult_proc : process(clk)
    begin 
      if clk'event and clk= '1' then   
        p <= std_logic_vector(unsigned(a) * unsigned(b));
      end if;
    end process;
  end generate;

  fb : if rep = "signed" generate
    signed_mult_proc : process(clk)
    begin
      if clk'event and clk='1' then
        p <= std_logic_vector(signed(a)*signed(b));
      end if;
    end process;
  end generate;
end rtl;