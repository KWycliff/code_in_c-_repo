
library ieee;
use ieee.std_logic_1164.all;

entity sign_xtnd is
    port(
        a : in std_logic_vector(7 downto 0);
        b : in std_logic_vector(3 downto 0)
    );
end entity sign_xtnd;

-- sign extension is important. it is used to prevent overflow given the resources are available by increasing the number of bits
architecture rtl of sign_xtend is
begin
    sign_extension_proc : process(b)
        a(3 downto 0) <= b
        for i in 4 to 7 loop
            a(i) <= b(3);
        end loop;
    end process sign_extension_proc;
end rtl;
