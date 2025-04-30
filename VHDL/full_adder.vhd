-- *************************************************
-- *                                               *
-- * SOURCE-FILE : full_adder.vhd               *
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
-- 2023-08-03      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- A full adder
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        cin : in std_logic;   -- carry in
        x   : in std_logic;   -- input x
        y   : in std_logic;   -- input y
        s   : out std_logic;  -- sum output
        cout: out std_logic   -- carry out
    );
end entity full_adder;

architecture rtl of full_adder is
    begin
        s <= x xor y xor cin;
        cout <= (y and cin) or (x and cin) or (x and y);
end rtl;