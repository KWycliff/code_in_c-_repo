
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package package_func is

    function clog2(bit_width: in integer) return integer; -- this is the custom function declaration
end package package_func;

package body package_func is
    -- this is the function description inside the package body
    -- 
    function clog2(bit_width: in integer) return integer is 
        variable i : integer;
        variable x : integer; 
    begin
        i := 0;
        x := bit_width;
        while x /= 1 loop
            x := x - (x/2);
            i := i + 1;
        end loop;
        return i;
    end function clog2;
end package body package_func;
