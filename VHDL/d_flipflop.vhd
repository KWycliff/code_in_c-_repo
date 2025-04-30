-- *************************************************
-- *                                               *
-- * SOURCE-FILE : d_flipflop.vhd               *
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
-- 2023-08-10      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- The d flipflop
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- d flip flip with clear, preset and enable
entity d_flipflop is 
    port(
        clk     : in std_logic;     -- clock signal
        resetn  : in std_logic;     -- active low clear
        e       : in std_logic;      -- enable  
        d       : in std_logic_vector(3 downto 0); -- input data
        q3       : out std_logic_vector(3 downto 0) -- output data
    );
end entity d_flipflop;

architecture rtl of d_flipflop is
begin
    proc_dff : process(clk, resetn, e)
    begin
        if resetn = '0' then
            q3 <= (others => '0');
        elsif clk'event and clk = '1' then
            if e = '1' then
                q3 <= d;
            end if;
        end if;
    end process proc_dff;
end rtl;