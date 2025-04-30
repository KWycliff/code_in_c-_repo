-- *************************************************
-- *                                               *
-- * SOURCE-FILE : n_bit_adder_tb.vhd               *
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
-- A testbench to show the behavior of the n bit adder subtractor 
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n_bit_adder_tb is
    generic(N : integer := 4);
end entity n_bit_adder_tb;

architecture beh of n_bit_adder_tb is
    component n_bit_adder
    port(
        addsub      : in std_logic;                         
        x           : in std_logic_vector(N-1 downto 0);       
        y           : in std_logic_vector(N-1 downto 0);
        s           : out std_logic_vector(N-1 downto 0);
        cout        : out std_logic;
        overflow    : out std_logic    
    );
    end component n_bit_adder;

    -- inputs
    signal addsub   : std_logic := '0';
    signal x        : std_logic_vector(N-1 downto 0) := (others => '0');
    signal y        : std_logic_vector(N-1 downto 0) := (others => '0');

    --outputs
    signal s        : std_logic_vector(N-1 downto 0);
    signal cout     : std_logic;
    signal overflow : std_logic;

    begin
        n_bit_adder_i : n_bit_adder
        port map(
            addsub   => addsub,
            x        => x,
            y        => y,
            s        => s,
            cout     => cout,
            overflow => overflow);

        stimulus_proc : process
        begin
            wait for 100 ns;
            addsub <= '0';
            x      <= x"1";
            y      <= x"3";

            wait for 100 ns;
            addsub <= '1';
            x      <= x"F";
            y      <= x"7";

            wait for 100 ns;
            addsub <= '0';
            x      <= x"6";
            y      <= x"4";

            wait for 100 ns;
            addsub <= '1';
            x      <= x"F";
            y      <= x"C";

            wait for 100 ns;
            addsub <= '0';
            x      <= x"A";
            y      <= x"3";

            wait for 100 ns;
            addsub <= '1';
            x      <= x"C";
            y      <= x"5";

            wait for 100 ns;
            addsub <= '0';
            x      <= x"4";
            y      <= x"E";

            wait for 100 ns;
            addsub <= '1';
            x      <= x"1";
            y      <= x"3";

            wait for 100 ns;
            addsub <= '1';
            x      <= x"5";
            y      <= x"7";
            
            wait;
        end process stimulus_proc;
end beh;




