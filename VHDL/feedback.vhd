
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity feedback is 
end entity;

architecture rtl of feedback is 
signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal rdisp6b_r0 : std_logic := '0';
signal rdisp : std_logic := '0';
signal flip_rdisp : std_logic := '0'; 
begin 
process_rdisp : process(clk)
  begin
    if clk'event and clk='1' then
      if reset = '1' then
        rdisp6b_r0 <= '0';
        rdisp <= '0'; 
      else
        if flip_rdisp = '1' then
          rdisp6b_r0 <= not rdisp;
        else
          rdisp6b_r0 <= rdisp;
        end if;
      end if;
    end if; 
  end process;
end rtl;