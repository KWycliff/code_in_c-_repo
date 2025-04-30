
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count_bits is
    port(
        clk : in std_logic;
        data_in : in std_logic_vector(3 downto 0);
        bit_count : out std_logic_vector(2 downto 0)
    );
end entity count_bits;

architecture rtl of count_bits is
    signal bit_count_i : std_logic_vector(2 downto 0) := (others=>'0');
    signal sum : unsigned(2 downto 0) := (others=>'0');

    function addsub(a:unsigned(2 downto 0); b:unsigned(2 downto 0)) return unsigned is
        variable res : unsigned(2 downto 0);
        begin
            res := a +b;
            return res;
    end function addsub;
    begin

        bit_count <= bit_count_i;
        lut_process : process(clk)
        variable count : unsigned(bit_count_i'range);
        begin
            if clk'event and clk='1' then
                count := (others=>'0');
                for i in data_in'range loop
                    if data_in(i)='0' then
                        count := count +1;
                    end if;
                end loop;
                bit_count_i <= std_logic_vector(count);
                sum <= addsub(count,count);  
            end if;
        end process lut_process;

end architecture rtl;

--000 11
--001 10
--010 10
--011 01
--100 10
--101 01
--110 01
--111 00