-- *************************************************
-- *                                               *
-- * SOURCE-FILE : n_bit_adder.vhd               *
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
-- n bit adder subtractor
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity n_bit_adder is
    generic (N : integer := 4);
    port(
        addsub      : in std_logic;                         -- select 0 to add or select 1 to subtract
        x           : in std_logic_vector(N-1 downto 0);      -- 
        y           : in std_logic_vector(N-1 downto 0);
        s           : out std_logic_vector(N-1 downto 0);
        cout        : out std_logic;
        overflow    : out std_logic    
    );
end entity n_bit_adder;

architecture rtl of n_bit_adder is
    component full_adder
    port(
        cin : in std_logic;   -- carry in
        x   : in std_logic;   -- input x
        y   : in std_logic;   -- input y
        s   : out std_logic;  -- sum output
        cout: out std_logic   -- carry out
    );
    end component full_adder;

    signal c : std_logic_vector(N downto 0);
    signal yt: std_logic_vector(N-1 downto 0);

    begin
        c(0) <= addsub;
        cout <= c(N);
        overflow <= c(N) xor c(N-1);
        
        adder_loop : for i in 0 to N-1 generate
                        yt(i) <= y(i) xor addsub;
                        fi : full_adder 
                            port map(
                                cin  => c(i),
                                x    => x(i),
                                y    => yt(i),
                                s    => s(i),
                                cout => c(i+1));
        end generate;             
end rtl;