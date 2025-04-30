
-- A majority gate
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity maj_gate2 is
    generic(N : integer := 8);
    port( 
        a : in std_logic_vector(N-1 downto 0);
        b : in std_logic_vector(N-1 downto 0);
        c : in std_logic_vector(N-1 downto 0);
        f : out std_logic_vector(N-1 downto 0);
        y_err : out std_logic
    );
end entity;

architecture rtl of maj_gate2 is
    begin
        maj_gate_proc : process(a,b,c)
        begin
            y_err <= '0';
            f <= (others => '0');
            if (a=b) then
                f <= a;
            end if;
            if (a=c) then
                f <= c;
            end if;
            if (b=c) then
                f <= b;
            end if;
            if (a/=b) and (a/=c) and (b/=c) then
                y_err <= '1';
            end if;
        end process;
end rtl;
