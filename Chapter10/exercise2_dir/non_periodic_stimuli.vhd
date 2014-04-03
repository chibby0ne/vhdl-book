--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: non_periodic_stimuli.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-04-01
--!
--!
--------------------------------------
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg_support.all;
use work.pkg_types.all;
--------------------------------------
entity non_periodic_stimuli is
--generic declarations
end entity non_periodic_stimuli;
--------------------------------------
architecture circuit of non_periodic_stimuli is
    signal sig1: std_logic := '1';
    signal sig2: std_logic := '1';
    signal sig3: std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(3, sig3'length));
begin
    
    -- sig1
    
    -- (i) concurrent
    -- sig1 <= '0' after 25 ns, '1' after 75 ns, '0' after 100ns;
    
    -- (ii) sequential
    sig1_proc: process 
        --declarativepart
    begin
        sig1 <= '1';
        wait for 25 ns;
        sig1 <= '0';
        wait for 50 ns;
        sig1 <= '1';
        wait for 25 ns;
        sig1 <= '0';
        wait;
    end process sig1_proc;

    
    -- sig2
    
    -- (i) concurrent
    -- sig2 <= '0' after 25 ns, '1' after 75 ns, '0' after 100 ns, '1' after 125 ns, '0' after 175 ns, '1' after 200 ns, '0' after 225 ns;
    
    -- (ii) sequential
    sig2_proc: process 
    --declarativepart
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
        sig2 <= '1';
        wait for 25 ns;
        sig2 <= '0';
        wait;
    end process sig2_proc;

    
    -- sig3
   
   -- (i) concurrent
    -- sig3 <= std_logic_vector(to_unsigned(0, sig3'length)) after 25 ns, 
    --         std_logic_vector(to_unsigned(99, sig3'length)) after 50 ns,
    --         std_logic_vector(to_unsigned(17, sig3'length)) after 100 ns,
    --         std_logic_vector(to_unsigned(255, sig3'length)) after 175 ns;
    --
    
    -- (ii) sequential
    sig3_proc: process 
    begin
        sig3 <= std_logic_vector(to_unsigned(3, sig3'length));
        wait for 25 ns;
        sig3 <= std_logic_vector(to_unsigned(0, sig3'length));
        wait for 25 ns;
        sig3 <= std_logic_vector(to_unsigned(99, sig3'length));
        wait for 50 ns;
        sig3 <= std_logic_vector(to_unsigned(17, sig3'length));
        wait for 75 ns;
        sig3 <= std_logic_vector(to_unsigned(255, sig3'length));
        wait;
    end process sig3_proc;
end architecture circuit;

