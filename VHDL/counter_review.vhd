--review of vhdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_review is
    port(
        clk : in std_logic; -- clock signal
        rstn : in std_logic;
        count_out : out std_logic_vector(3 downto 0)
    );
end entity counter_review;

architecture rtl of counter_review is
    constant max_count : natural := 8;
    signal count : unsigned(3 downto 0):= (others => '0');
    signal pulse : std_logic := '0';
    signal pulse_r : std_logic := '0';
    signal pulse_edge : std_logic := '0';
    signal count_out_i : std_logic_vector(3 downto 0) := (others =>'0');
    begin
        pulse_edge <= pulse_r xor pulse;
        count_out <= count_out_i;
        count_process : process(clk)
        begin
            if clk'event and clk = '1' then 
                if rstn = '0' then
                    count <= (others=>'0');
                    --pulse <= '0';
                else
                    if count = max_count-1 then
                        count <= (others=>'0');
                        --pulse <= '0';
                    else
                        count <= count + 1;
                        --pulse <= '1';
                    end if;    
                end if;
            end if;
        end process count_process;

        output_process : process(clk)
        begin
            if clk'event and clk='1' then
                count_out_i <= std_logic_vector(count);
            end if;
        end process;

        edge_process : process(clk)
        begin
            if clk'event and clk='1' then
                pulse_r <= pulse;
            end if;
        end process;

        pulse <= '1' when (count = x"2" or count =x"3" or count =x"4") else '0';

    end architecture rtl;
