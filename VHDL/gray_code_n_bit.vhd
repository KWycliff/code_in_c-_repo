
--This is a binary to gray code converter
library ieee;
use ieee.std_logic_1164.all;

entity gray_code_n_bit is 
    generic( N : integer := 4);
    port(
        b : in std_logic_vector(N-1 downto 0); -- Binary input
        g : out std_logic_vector(N-1 downto 0) -- equivalent gray_code output
    );
end entity gray_code_n_bit;

architecture rtl of gray_code_n_bit is
begin
    g(N-1) <= b(N-1);
    gray_code_gen : for i in 0 to N-2 generate
                        g(i) <= b(i) xor b(i+1); -- xor b from lsb to N-2, ie apart from the msb
                    end generate;
end rtl;