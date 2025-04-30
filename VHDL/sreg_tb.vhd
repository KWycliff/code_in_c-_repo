-- shift register testbench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sreg_tb is 
end entity sreg_tb;

architecture beh of sreg_tb is 
  constant dat_width : natural := 10;
  constant clk_period : time := 5 ns;
  signal dat_in : std_logic_vector(dat_width-1 downto 0):= (others=>'0');
  signal shift_reg : std_logic_vector(dat_width-1 downto 0):= (others=>'0');
  signal clk : std_logic := '0';
  signal ivalid : std_logic := '0';
  signal ingr_rdy : std_logic := '0';
  signal eready : std_logic := '0';
  signal evalid : std_logic := '0';
  signal data_out : std_logic := '0';
begin 

  clk <= not clk after clk_period/2;

  --input stim proc
  stim_proc : process 
  begin 
    ivalid <= '1';
    eready <= '1';
    for i in 0 to 25 loop
        dat_in <= "10"&x"AA";  
        wait until ingr_rdy ='1';
        wait until clk'event and clk='1';
        dat_in <= "10"&x"63";
        wait until ingr_rdy ='1';
        wait until clk'event and clk='1';
    end loop;
  end process;
 
  -- serial tp parallel process
  ser_proc : process(clk)
  begin 
    if clk'event and clk='1' then 
      shift_reg <= shift_reg(dat_width-2 downto 0) & data_out;
    end if;
  end process;  
  
  sreg_inst: entity work.sreg
   generic map(
      width => dat_width
  )
   port map(
      clk => clk,
      dat_in => dat_in,
      ivalid => ivalid,
      ingr_rdy => ingr_rdy,
      eready => eready,
      egrvalid => evalid,
      data_out => data_out
  );
end beh;