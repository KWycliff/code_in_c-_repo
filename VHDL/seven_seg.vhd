
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg is
    port(
     clk       : in std_logic;
     sevenseg  : out std_logic_vector(6 downto 0)   
    );
end entity;

architecture rtl of seven_seg is
    signal e_cnt  : unsigned(25 downto 0) := (others=> '0');
    signal count : unsigned(4 downto 0) := (others => '0');
    signal seg_led : std_logic_vector(6 downto 0) := (others => '0');
    signal sevenseg_i : std_logic_vector(6 downto 0) := (others => '0');
    signal sevenseg_i1 : std_logic_vector(6 downto 0) := (others => '0');
    signal en : std_logic := '0';
begin

    sevenseg <= sevenseg_i1;

    process_enable_gen : process(clk)
    begin
        if clk'event and clk='1' then
            if e_cnt = x"2625A00" then
                en <= '1';
                e_cnt <= (others =>'0');
            else 
                en <= '0';
                e_cnt <= e_cnt + 1;
            end if;
        end if;
    end process;
    process_count : process(clk)
    begin
        if clk'event and clk='1' then
            if en = '1' then
                if count = x"F" then
                    count <= (others =>'0');
                else 
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;

    seven_seg_decode_proc : process(count)
    begin
        case count is
            when x"0" =>
                seg_led <= "1111110";
            when x"1" =>
                seg_led <= "0110000";
            when x"2" =>
                seg_led <= "1101101";
            when x"3" =>
                seg_led <= "1111001";
            when x"4" =>
                seg_led <= "0110011";
            when x"5" =>
                seg_led <= "1011011";
            when x"6" =>
                seg_led <= "1011111";
            when x"7" =>
                seg_led <= "1110000";
            when x"8" =>
                seg_led <= "1111111";
            when x"9" =>
                seg_led <= "1111011";
            when x"A" =>
                seg_led <= "1110111";
            when x"B" =>
                seg_led <= "0011111";
            when x"C" =>
                seg_led <= "1001110";
            when x"D" =>
                seg_led <= "0111101";
            when x"E" =>
                seg_led <= "1001111";
            when x"F" =>
                seg_led <= "1000111";
            when others =>
                seg_led <= "-------";
        end case;
    end process;

    
    reg_seg_process : process(clk)
    begin
        if clk'event and clk='1' then
            sevenseg_i <= not seg_led;
            sevenseg_i1 <= sevenseg_i;
        end if;
    end process;

end rtl;