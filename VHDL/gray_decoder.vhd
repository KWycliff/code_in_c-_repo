-- *************************************************
-- *                                               *
-- * SOURCE-FILE : gray_decoder.vhd               *
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
-- 2023-08-01      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- Binary to Gray decoder with case statement
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity gray_decoder is
    port(
        b_g     : in std_logic_vector(2 downto 0);
        g       : out std_logic_vector(2 downto 0)
    );
end entity;

architecture rtl of gray_decoder is 
begin
    process_gray : process(b_g)
    begin 
    case b_g is
        when "000"   =>
            g <= "000";
        when "001"   =>
            g <= "001";
        when "010"   =>
            g <= "011";
        when "011"   =>
            g <= "010";
        when "100"   =>
            g <= "110";
        when "101"   =>
            g <= "111";
        when "110"   =>
            g <= "101";
        when others  =>
            g <= "100";
    end case;
    end process;
end rtl;