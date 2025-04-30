
-- testting a new shift register method
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sreg is 
  generic(width : natural := 10
  );
  port(
    clk      : in std_logic;
    dat_in   : in std_logic_vector(width-1 downto 0);
    ivalid   : in std_logic;
    ingr_rdy : out std_logic;
    eready   : in std_logic;
    egrvalid : out std_logic;
    data_out : out std_logic
  );
end entity;

architecture rtl of sreg is 
  signal count_indx  : unsigned(3 downto 0) :=(others=>'0');
  signal d_reg       : std_logic_vector(0 to width) := (others=>'0');
  signal shift_busy  : std_logic := '0';
  signal iready      : std_logic := '0';
  signal require_dat : std_logic := '0';
  signal evalid      : std_logic := '0';
  signal data_out_i  : std_logic := '0';
begin 
  ingr_rdy <= iready;
  egrvalid <= evalid;
  data_out <= data_out_i; 
  data_out_proc : process(clk)
  variable cnt_temp : unsigned(3 downto 0):= (others=>'0');
  begin 
    if clk'event and clk='1' then 
      require_dat <= '0';
      if evalid='1' and eready='1' then
        cnt_temp := count_indx -1;
        count_indx <= cnt_temp; 
        data_out_i <= d_reg(to_integer(cnt_temp));
        if count_indx = 2 then 
          require_dat <= '1';
        end if;
      end if;
      if ivalid ='1' and iready='1' then
        d_reg <=dat_in (width-1) & dat_in ;
        data_out_i <= dat_in(0); 
        count_indx <= to_unsigned(width,4);
      end if;
    end if;
  end process;

  shift_busy <= '0' when count_indx = to_unsigned(0,4) else '1';
  iready <= '1' when (shift_busy='0' or require_dat='1') and eready ='1' else '0';
  evalid <= shift_busy;

end rtl;
