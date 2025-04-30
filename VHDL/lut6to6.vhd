
library ieee;
use ieee.std_logic_1164.all;

entity lut6to6 is
    generic(
        data5 : std_logic_vector(63 downto 0) := x"ffffffc000000000";
        data4 : std_logic_vector(63 downto 0) := x"fc00003ffffc0000";
        data3 : std_logic_vector(63 downto 0) := x"03ff003ff003ff00";
        data2 : std_logic_vector(63 downto 0) := x"83e0f83e0f83e0f0";
        data1 : std_logic_vector(63 downto 0) := x"639ce739ce7398cc";
        data0 : std_logic_vector(63 downto 0) := x"5a5296b5ad6a56aa"
    );
    port(
    clk     : in std_logic;
    resetn  : in std_logic;
    oe      : in std_logic;
    data    : inout std_logic_vector(5 downto 0)
    );
end entity lut6to6;

architecture rtl of lut6to6 is
    
