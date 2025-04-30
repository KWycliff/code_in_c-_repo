
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg_top is
    port(
     clk_in       : in std_logic;
     sevenseg     : out std_logic_vector(6 downto 0)   
    );
end entity;

architecture rtl of seven_seg_top is
    component clk_gen is
        port(
        clk_in  : in std_logic;
        clk_out : out std_logic
        );  
    end component;

    signal clk : std_logic := '0';
 
begin
    clk_gen_i : clk_gen
    port map(
        clk_in => clk_in,
        clk_out => clk
    );

    seven_seg_i : entity work.seven_seg
     port map(
        clk      => clk,
        sevenseg => sevenseg
    );
end rtl;