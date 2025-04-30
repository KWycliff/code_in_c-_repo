-- *************************************************
-- *                                               *
-- * SOURCE-FILE : n_int_counter.vhd               *
-- *                                               *
-- *************************************************
-- COPYRIGHT AURI STUDIO 
-- This document must not be copied without our written permission,
-- and the contents thereof must not be imparted to a third party
-- nor be used for any unauthorized purpose. Contravention will be
-- prosecuted.
-- 
-- DEPARTMENT  : UMHF
-- DESIGNED BY : Wycliff Kaweesa
-- TARGET      : S7
-- CHECKED BY  : 
-- APPROVED BY :  
-- PROJECT     : Training UMHF
-- RELEASED    : 
-- 
-- VERSION/ REVISION/ DATE FOR REV./ INTRODUCED BY/ REV. APPROVED BY
-- ------------------------------------------------------------------------
-- Date            : Version   Comment
-- 2023-08-22      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- This is a modulo-N counter
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.package_func.all;

entity n_int_counter is
    generic(N : integer := 10);
    port(
        clk         : in std_logic;             -- clock signal
        resetn      : in std_logic;             -- clear all flipflops to '0' when resetn is '0' (active low)
        en          : in std_logic;             -- enable input for the counter
        z           : out std_logic;            -- it goes high at max count
        q_out       : out std_logic_vector(clog2(N)-1 downto 0)-- count output
    );
end entity n_int_counter;

architecture rtl of n_int_counter is 
signal q_t : unsigned(clog2(N)-1 downto 0);
begin
    count_process : process(resetn, clk)
    begin
        if resetn = '0' then
            q_t <= (others => '0');
        elsif(clk'event and clk = '1') then
            if en = '1' then
                if q_t = N-1 then
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