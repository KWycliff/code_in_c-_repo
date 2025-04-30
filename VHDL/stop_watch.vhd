-- *************************************************
-- *                                               *
-- * SOURCE-FILE : stop_watch.vhd               *
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
-- A simple stop watch
-------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.package_func.all;

entity stop_watch is 
    generic(
        sw_width_m10 : integer := 10;
        sw_width_m6  : integer := 6
        );
    port(
        pause   : in std_logic;
        resetn  : in std_logic;
        clk     : in std_logic;
        q1      : out std_logic_vector(clog2(sw_width_m10)-1 downto 0);
        q2      : out std_logic_vector(clog2(sw_width_m10)-1 downto 0);
        q3      : out std_logic_vector(clog2(sw_width_m10)-1 downto 0);
        q4      : out std_logic_vector(clog2(sw_width_m6)-1 downto 0)
        );
end entity stop_watch;

architecture rtl of stop_watch is
-- the n bit counter
component n_int_counter
    generic(N : integer := 10);
    port(
        clk         : in std_logic;             -- clock signal
        resetn      : in std_logic;             -- clear all flipflops to '0' when resetn is '0' (active low)
        en          : in std_logic;             -- enable input for the counter
        z           : out std_logic;            -- it goes high at max count
        q_out       : out std_logic_vector(clog2(N)-1 downto 0)-- count output
    );
end component n_int_counter;
signal npause : std_logic;
signal z  : std_logic;
signal z1 : std_logic;
signal z2 : std_logic;
signal z3 : std_logic;
signal e2 : std_logic;
signal e3 : std_logic;
signal e4 : std_logic;

-- begin instantiation and connect the different counters
begin
    npause  <= not(pause);
    e2      <= z1 and z;
    e3      <= z2 and e2;
    e4      <= z3 and e3;
    
    countz : n_int_counter
    generic map(N => 10**3)
    port map(
        clk     => clk,
        resetn  => resetn,
        en      => npause,
        z       => z
            );
    count1 : n_int_counter
    generic map(N => sw_width_m10)
    port map(
        clk     => clk,
        resetn  => resetn,
        en      => z,
        z       => z1,
        q_out   => q1
    );
    count2 : n_int_counter
    generic map(N => sw_width_m10)
    port map(
        clk     => clk,
        resetn  => resetn,
        en      => e2,
        z       => z2,
        q_out   => q2
    );
    count3 : n_int_counter
    generic map(N => sw_width_m10)
    port map(
        clk     => clk,
        resetn  => resetn,
        en      => e3,
        z       => z3,
        q_out   => q3        
    );
    count4 : n_int_counter
    generic map(N => sw_width_m6)
    port map(
        clk     => clk,
        resetn  => resetn,
        en      => e4,
        q_out   => q4        
    );  
end rtl;  