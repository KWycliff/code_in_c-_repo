
-- Majority Gate
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity majority_gate is
    generic(N : integer := 8);
    port(
        a       : in std_logic_vector(N-1 downto 0);
        b       : in std_logic_vector(N-1 downto 0);
        c       : in std_logic_vector(N-1 downto 0);
        f       : out std_logic_vector(N-1 downto 0);
        y_err   : out std_logic
    );
end entity;

architecture rtl of majority_gate is
    begin
        maj_gate_proc : process(a, b, c)
        begin
            y_err <= '0';
            if (a= b) then
                f <= a;
            
            elsif (a= c) then
                f <= a;
            
            elsif (b= c) then
                f <= b;
            
            
            else
                f <= (others => '0');
                y_err <= '1';   
            end if;
        end process maj_gate_proc;
end rtl;            
