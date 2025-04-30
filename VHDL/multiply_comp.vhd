
library ieee;
use ieee.std_logic_1164.all;

entity multiply_comp is
    port(
       a : in std_logic_vector(3 downto 0);
       b : in std_logic_vector(3 downto 0);
       r : out std_logic_vector(3 downto 0);
       p : out std_logic_vector(7 downto 0)
    );
end entity multiply_comp;

architecture rtl of multiply_comp is

signal s : std_logic_vector(3 downto 0);
signal c : std_logic_vector(2 downto 0);

begin
and_i : for i in 0 to 3 generate 
    r(i) <= a(i) and b(i);
    end generate;
end rtl;
