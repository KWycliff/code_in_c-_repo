library ieee;
use ieee.std_logic_1164.all;

entity shift_1x64 is
	port 
	(
		sr_in	: in std_logic;
		enable	: in std_logic;
		clk		: in std_logic;
		sr_out	: out std_logic
	);
	
end entity;

architecture rtl of shift_1x64 is

	-- Build an array type for the shift register
	type sr_length is array (63 downto 0) of std_logic;
	
	-- Declare the shift register signal
	signal sr: sr_length;

begin

	process (clk)
	begin
		if (rising_edge(clk)) then
			if (enable = '1') then
			
				-- Shift data by one stage; data from last stage is lost
				sr(63 downto 1) <= sr(62 downto 0);
				
				-- Load new data into the first stage
				sr(0) <= sr_in;
			
			end if;
		end if;
	end process;
	
	-- Capture the data from the last stage, before it is lost
	sr_out <= sr(63);
	
end rtl;
