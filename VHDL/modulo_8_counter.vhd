
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.package_func.all;

entity modulo_8_counter is
    generic(N : integer := 8);
    port(
        clk         : in std_logic;             -- clock signal
        resetn      : in std_logic;             -- clear all flipflops to '0' when resetn is '0' (active low)
        en          : in std_logic;             -- enable input for the counter
        sclr        : in std_logic;             -- synchronous clear
        z           : out std_logic;            -- it goes high at max count
        q_out       : out std_logic_vector(clog2(N)-1 downto 0)-- count output
    );
end entity modulo_8_counter;

architecture rtl of modulo_8_counter is 
signal q_t : unsigned(clog2(N)-1 downto 0);
begin
    count_process : process(resetn, clk)
    begin
        if resetn = '0' then
            q_t <= (others => '0');
        elsif(clk'event and clk = '1') then
            if en = '1' then
                if sclr = '1' then
                    q_t <= (others => '0');
                elsif q_t = N-1 then
                    q_t <= (others => '0');
                else
                    q_t <= q_t + 1;
                end if;
            end if;
        end if;    
    end process count_process;
z <= '1' when q_t = (N-1) else '0';    
q_out <= std_logic_vector(q_t);
end rtl;