
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count_bits_tb is
end entity count_bits_tb;

architecture beh of count_bits_tb is
constant max_count : natural := 16;
signal clk : std_logic := '0';
signal data_in : std_logic_vector(3 downto 0):= (others=> '0');
signal bit_count : std_logic_vector(2 downto 0):= (others=> '0');
signal count : unsigned(data_in'range) := (others=>'0');
signal res_out : unsigned(3 downto 0) := (others=>'0');

procedure addres(
    a : in unsigned(3 downto 0);
    b : in unsigned(3 downto 0);
    res : out unsigned(3 downto 0)
)is
    begin
        res := a+b;
end procedure;

    begin
        clk <= not clk after 25 ns;

        input_stimulus_proc : process(clk)
        begin
            if clk'event and clk='1' then
                if count = max_count-1 then
                    count <= (others=>'0');
                else
                    count <= count + 1;
                end if;
                data_in <= std_logic_vector(count);
            end if;
        end process;

        process_add : process(clk)
        variable result : unsigned(3 downto 0);
        begin
            if clk'event and clk='1' then
                addres(count,count,result);
                res_out <= result;
            end if;
        end process;

        count_bits_inst: entity work.count_bits
         port map(
            clk => clk,
            data_in => data_in,
            bit_count => bit_count
        );
    end beh;

