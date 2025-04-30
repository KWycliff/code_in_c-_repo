-- *************************************************
-- *                                               *
-- * SOURCE-FILE : sr_flipflop.vhd               *
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
-- The sr flip flop
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- sr_flipflop with an enable signal
entity sr_flipflop is
    port(
        clk : in std_logic;
        s   : in std_logic;
        r   : in std_logic;
        q1   : out std_logic; -- sr output
        qn1  : out std_logic  -- sr inverted output
    );
end entity sr_flipflop;

architecture rtl of sr_flipflop is
signal qt1 : std_logic;
signal qtn1 : std_logic;

begin
    sr_process : process(clk, s, r)
    begin
        if (clk'event and clk = '1') then
            if s = '0' and r = '1' then 
                qt1 <= '0';
                qtn1 <= '1';
            elsif s = '1' and r = '0' then
                qt1 <= '1';
                qtn1 <= '0';
            elsif s = '1' and r = '1' then
                qt1 <= '0';
                qtn1 <= '0';
            end if;
        end if;
    end process sr_process;
q1 <= qt1;
qn1 <= qtn1;    
end rtl;