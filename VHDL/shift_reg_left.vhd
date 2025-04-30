
library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_left is
    port(
        clk     : in std_logic;  
        resetn  : in std_logic;                    -- active low reset 
        d       : in std_logic_vector(3 downto 0); -- parallel input
        e       : in std_logic;                    -- enable 
        s_l     : in std_logic;                    -- s_l = 1 for parallel load else serial load
        din     : in std_logic;                    -- serial input
        dout1   : out std_logic;                   -- serial output for left shift register
        q1      : out std_logic_vector(3 downto 0) -- parallel output
    );        
end entity shift_reg_left;

architecture rtl of shift_reg_left is
signal q_t : std_logic_vector(3 downto 0) := (others => '0');
begin
    left_shift_process : process(resetn, clk)
    begin
        if resetn = '0' then
            q_t <= x"0";
        elsif (clk'event and clk = '1') then
            if e = '1' then
                if s_l = '1' then
                    q_t <= d;
                else
                    q_t <= q_t(2 downto 0) & din;
                end if;
            end if;
        end if;
    end process left_shift_process;
    q1 <= q_t;
    dout1 <= q_t(3);
end rtl;

