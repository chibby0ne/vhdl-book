--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: periodic_stimuli.vhd
--! @brief: write and simulate a vhdl code that generates the signs sig1 and sig2 and signal y
--! @author: Antonio Gutierrez
--! @date: 2014-04-01
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity periodic_stimuli is
--generic declarations
end entity periodic_stimuli;
--------------------------------------
architecture circuit of periodic_stimuli is
    signal sig1: std_logic := '1';
    signal sig2: std_logic := '1';
    signal y: std_logic: = '1';
begin
    
    -- stimuli sig1
    -- (ii) sequential
    sig1_proc: process 
    begin
        sig1 <= '1';
        wait for 25 ns;
        sig1 <= '0';
        wait for 50 ns;
    end process sig1_proc;

    sig2_proc: process 
    begin
        sig2 <= '1';
        wait for 25 ns;
        sig2 <= '0';
        wait for 50 ns;
        sig2 <= '1';
        wait for 25 ns;
        sig2 <= '0';
        wait for 25 ns;
        sig2 <= '1';
        wait for 50 ns;
        sig2 <= '0';
        wait for 25 ns;
    end process sig2_proc;

    y_proc: process 
    begin
        y <= '1';
        wait for 20 ns;
        y <= '0';
        wait for 10 ns;
        y <= '1';
        wait for 10 ns;
        y <= '0';
        wait for 40 ns;
    end process y_proc;
end architecture circuit;
--------------------------------------
