
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity custom_array_type is
    generic(
        B : integer := 8; -- bitwidth of each input
        N : integer := 16 -- number of inputs
    );
    port(
        d : in std_logic_vector(B*N-1 downto 0);
        sel : in std_logic_vector(integer(ceil(log2(real(N))))-1 downto 0);
        f   : out std_logic_vector(B-1 downto 0)
    );
end entity custom_array_type;

architecture rtl of custom_array_type is
    type two_dim is array (N-1 downto 0) of std_logic_vector(B-1 downto 0); -- two dimensional array type
    signal di : two_dim; -- a signal di of type two_dim
begin
    --converting std_logic_vector to two_dim
st : for i in 0 to N-1 generate
        di(i) <= d(B*(N-i)-1 downto B*(N-(i+1)));
    end generate;
    f <= di(to_integer(unsigned(sel))); -- this is a mux operation method using indexing
end rtl;