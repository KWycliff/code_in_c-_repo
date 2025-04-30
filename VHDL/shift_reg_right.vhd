
library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_right is
    port( 
        clk     : in std_logic;  
        resetn  : in std_logic;                    -- active low reset 
        d       : in std_logic_vector(3 downto 0); -- parallel input
        e       : in std_logic;                    -- enable 
        s_l     : in std_logic;                    -- s_l = 1 for parallel load else serial load
        din     : in std_logic;                    -- serial input
        dout    : out std_logic;                   -- serial output for right shift register
        q       : out std_logic_vector(3 downto 0) -- parallel output 
    );
end entity shift_reg_right;

architecture rtl of shift_reg_right is
signal qt : std_logic_vector(3 downto 0) := (others => '0');
begin
    shift_right_process : process(resetn, clk)
    begin
        if (resetn = '0') then
            qt <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (e = '1') then
                if (s_l = '1') then
                    qt <= d;
                else 
                    qt <= din & qt(3 downto 1);  
                end if;
            end if;
        end if;
    end process shift_right_process;

    q <= qt;
    dout <= qt(0);
end rtl;
