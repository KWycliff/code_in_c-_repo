
library ieee;
use std.textio.all;

entity simple_textio IS
end entity simple_textio;

architecture beh OF simple_textio is
begin
    simple_textio_proc : process
    variable i: integer:= 42;
    variable LLL: line;
    begin
        write (LLL, i);
        writeline (OUTPUT, LLL);
        wait;
    end process simple_textio_proc;
end beh;