-- *************************************************
-- *                                               *
-- * SOURCE-FILE : count_reg_fsm_v2.vhd               *
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
-- 2023-09-09      : v1.0.0.0  Created first Version                          
--
-- DESCRIPTION
-- -----------
-- A Finite state machine that controls registers using a counter
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count_reg_fsm_v2 is
    port(
        clk     : in std_logic;
        resetn  : in std_logic;
        d       : in std_logic_vector(3 downto 0); -- input to the d flipflop (register)
        s       : in std_logic_vector(3 downto 0);  -- input to the shift register when parallel load is enabled
        qd      : out std_logic_vector(3 downto 0); -- output for the d flipflop(register)
        qs      : out std_logic_vector(3 downto 0); -- parallel output for the shift register
        sclk    : out std_logic -- it goes high when transitioning to the next state
    );
end entity count_reg_fsm_v2;

architecture rtl of count_reg_fsm_v2 is
type state is (s1, s2);
signal y        : state;
signal sclrq    : std_logic := '0';
signal eq       : std_logic := '0';
signal zq       : std_logic := '0';
signal ed       : std_logic := '0';
signal es       : std_logic := '0';
signal ls       : std_logic := '0';
signal din      : std_logic := '0';

begin
    state_transition : process(resetn, clk)
    begin
        if resetn = '0' then
            y <= s1;
        elsif(clk'event and clk = '1') then
            case y is 
                when s1 =>
                    if zq = '1' then
                        y       <= s2;
                    else
                        y       <= s1;
                    end if;
                when s2 =>
                    if zq = '1' then
                        y       <= s1;
                    else
                        y       <= s2;
                    end if;
            end case;
        end if;
    end process state_transition;    

    output_process : process(y, zq)
    begin
        sclrq   <= '0';
        eq      <= '0';
        ed      <= '0';
        es      <= '0';
        ls      <= '0';       
        case y is
            when s1 =>
                if zq = '1' then
                    sclrq   <= '1';
                    eq      <= '1';
                    ed      <= '1';
                    es      <= '1';
                    ls      <= '1';
                end if;
                    eq      <= '1';
                    sclk    <= '0';
            when s2 =>
                if zq = '1' then
                    eq      <= '1';
                    sclrq   <= '1';
                end if;
                    eq      <= '1';
                    es      <= '1';
                    sclk    <= '1';
            end case;
    end process output_process;

-- instantiation
    d_flipflop_i : entity work.d_flipflop
        port map(
            clk  => clk, 
            resetn => resetn,
            e   => ed,  
            d   => d,  
            q3  => qd  
        );
    shift_reg_left_i : entity work.shift_reg_left
        port map(
            clk   => clk,
            resetn => resetn,
            e     => es,  
            s_l   => ls,
            din   => din,
            d     => s,
            q1    => qs            
        );
    modulo_8_counter_i : entity work.modulo_8_counter
        port map(
            clk    => clk,
            resetn => resetn,
            en     => eq,
            sclr   => sclrq,
            z      => zq           
        );
end rtl;