
-- DESCRIPTION
-- -----------
-- A full adder
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        cin : in std_logic;   -- carry in
        x   : in std_logic;   -- input x
        y   : in std_logic;   -- input y
        s   : out std_logic;  -- sum output
        cout: out std_logic   -- carry out
    );
end entity full_adder;

architecture rtl of full_adder is
    begin
        s <= x xor y xor cin;
        cout <= (y and cin) or (x and cin) or (x and y);
end rtl;