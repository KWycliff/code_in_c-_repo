-- *************************************************
-- *                                               *
-- * SOURCE-FILE : majority_gate.vhd               *
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
-- 2023-07-30      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- Majority Gate
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity majority_gate is
    generic(N : integer := 8);
    port(
        a       : in std_logic_vector(N-1 downto 0);
        b       : in std_logic_vector(N-1 downto 0);
        c       : in std_logic_vector(N-1 downto 0);
        f       : out std_logic_vector(N-1 downto 0);
        y_err   : out std_logic
    );
end entity;

architecture rtl of majority_gate is
    begin
        maj_gate_proc : process(a, b, c)
        begin
            y_err <= '0';
            if (a= b) then
                f <= a;
            
            elsif (a= c) then
                f <= a;
            
            elsif (b= c) then
                f <= b;
            
            
            else
                f <= (others => '0');
                y_err <= '1';   
            end if;
        end process maj_gate_proc;
end rtl;            
