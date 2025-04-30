-- *************************************************
-- *                                               *
-- * SOURCE-FILE : maj_gate2_tb.vhd               *
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
-- 2023-07-31      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- A majority gate
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity maj_gate2_tb is
end entity ;

architecture rtl of maj_gate2_tb is
    component maj_gate2
    generic(N : integer := 4);
    port( 
        a : in std_logic_vector(N-1 downto 0);
        b : in std_logic_vector(N-1 downto 0);
        c : in std_logic_vector(N-1 downto 0);
        f : out std_logic_vector(N-1 downto 0);
        y_err : out std_logic
    );
    end component;

    component gray_decoder
        port(
            b_g     : in std_logic_vector(2 downto 0);
            g       : out std_logic_vector(2 downto 0)
            );
    end component;
    
    component decoder_2_4
    port(
        a_d : in std_logic_vector(1 downto 0);
        en  : in std_logic;
        b_d : out std_logic_vector(3 downto 0)
    );
   end component; 
   
    -- contants
    constant N : integer := 4;
    
    -- inputs
    signal a    : std_logic_vector(N-1 downto 0) := (others => '0');
    signal b    : std_logic_vector(N-1 downto 0) := (others => '0');
    signal c    : std_logic_vector(N-1 downto 0) := (others => '0');
    signal b_g  : std_logic_vector(2 downto 0) := "000";
    signal a_d  : std_logic_vector(1 downto 0) := "00";
    signal en   : std_logic := '0';

    -- outputs
    signal y_err : std_logic;
    signal f     : std_logic_vector(N-1 downto 0);
    signal g     : std_logic_vector(2 downto 0);
    signal b_d   : std_logic_vector(3 downto 0);
    
    

    begin
     -- instantiation which is assigning the signal values in the tb architecture to the component
        maj_gate2_i : maj_gate2
            port map(
                a => a,
                b => b,
                c => c,
                y_err => y_err,
                f => f
                );
        
        gray_decoder_i : gray_decoder
            port map(
                b_g => b_g,
                g => g
            );
            
        decoder_2_4_i : decoder_2_4
            port map(
                a_d => a_d,
                en => en,
                b_d => b_d
                );

        input_stimulus : process
            begin
                
                wait for 50 ns;
                a   <= x"0";
                b   <= x"0";
                c   <= x"0";
                b_g <= "000";
                a_d <= "00";
                en  <= '1';
                

                wait for 50 ns;
                a   <= x"1";
                b   <= x"2";
                c   <= x"1";
                b_g <= "001";
                a_d <= "01";
                en  <= '1';

                wait for 50 ns;
                a   <= x"2";
                b   <= x"3";
                c   <= x"3";
                b_g <= "010";
                a_d <= "10";
                en  <= '1';

                wait for 50 ns;
                a   <= x"5";
                b   <= x"6";
                c   <= x"6";
                b_g <= "011";
                a_d <= "11";
                en  <= '1';

                wait for 50 ns;
                a   <= x"E";
                b   <= x"2";
                c   <= x"C";
                b_g <= "100";
                a_d <= "10";
                en  <= '0';

                wait for 50 ns;
                a   <= x"E";
                b   <= x"E";
                c   <= x"C";
                b_g <= "101";
                a_d <= "01";
                en  <= '1';

                wait for 50 ns;
                a   <= x"1";
                b   <= x"2";
                c   <= x"3";
                b_g <= "110";
                a_d <= "11";
                en  <= '0';
                
                wait for 50 ns;
                b_g <= "111";
                a_d <= "01";
                en  <= '1';

                wait;
        end process;
end rtl;        

