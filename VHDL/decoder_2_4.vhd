-- *************************************************
-- *                                               *
-- * SOURCE-FILE : decoder_2_4.vhd               *
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
-- 2023-08-02      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- A 2 to 4 decoder using the case statement
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity decoder_2_4 is
    port(
        a_d : in std_logic_vector(1 downto 0);
        en  : in std_logic;
        b_d : out std_logic_vector(3 downto 0)
    );
end entity decoder_2_4;

architecture rtl of decoder_2_4 is
    begin
        decoder_proc : process(en, a_d)
        begin
            if en = '0' then
                b_d <= "0000";
            else
                case a_d is
                    when "00" =>
                        b_d <= "0001";
                    when "01" =>
                        b_d <= "0010";
                    when "10" =>
                        b_d <= "0100";
                    when "11" =>
                        b_d <= "1000";
                    when others =>
                        b_d <= "----";
                end case;
            end if;
        end process decoder_proc;
 end rtl;                
                    
                    