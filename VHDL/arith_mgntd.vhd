
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arith_mgntd is
    generic(N : integer := 8);
    port(
        a_a : in std_logic_vector(N-1 downto 0);
        b_b : in std_logic_vector(N-1 downto 0);
        r : out std_logic_vector(N-1 downto 0) 
    );
end entity arith_mgntd;

architecture rtl of arith_mgntd is

begin

arith_process: process (a_a, b_b)
variable m : unsigned(N-1 downto 0);
begin
    if a_a < b_b then
        m := unsigned(b_b) - unsigned(a_a);
        r <= std_logic_vector(m);
    else 
        m := unsigned(a_a) - unsigned(b_b);
        r <= std_logic_vector(m);
    end if;
    end process;
end rtl;