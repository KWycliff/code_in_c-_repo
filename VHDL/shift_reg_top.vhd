
library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_top is
    port(
        clk     : in std_logic;  
        resetn  : in std_logic;                    -- active low reset 
        d       : in std_logic_vector(3 downto 0); -- parallel input
        e       : in std_logic;                    -- enable 
        s_l     : in std_logic;                    -- s_l = 1 for parallel load else serial load
        din     : in std_logic;                    -- serial input
        dout    : out std_logic;                   -- serial output for right shift register
        q       : out std_logic_vector(3 downto 0);-- parallel output
        dout1   : out std_logic;                   -- serial output for left shift register
        q1      : out std_logic_vector(3 downto 0) -- parallel output                 
    );
end entity shift_reg_top;

architecture rtl of shift_reg_top is
begin
    shift_reg_right_i : entity work.shift_reg_right
    -- right shift register instantiation
        port map(
            clk     => clk,
            resetn  => resetn,
            d       => d,
            e       => e,
            s_l     => s_l,
            din     => din,
            dout    => dout,
            q       => q
        );
    
    -- left shift register instatiation
    shift_reg_left_i : entity work.shift_reg_left
        port map(
            clk     => clk,
            resetn  => resetn,
            d       => d,
            e       => e,
            s_l     => s_l,
            din     => din,
            dout1   => dout1,
            q1      => q1
        );
end rtl;
