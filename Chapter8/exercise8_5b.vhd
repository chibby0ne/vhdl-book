--! 
--! @file: exercise8_5b.vhd
--! @brief: synchronous counter using component
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
library work;
use work.pkg_sync_counter.all;
--------------------------------------
entity synchronous_counter is
    port (
        a, b, clk: in std_logic;
        q: out std_logic_vector(2 downto 0));
end entity synchronous_counter;
--------------------------------------
architecture circuit of synchronous_counter is
    signal andq: std_logic_vector(1 to 0);
begin
        sync_cell0: sync_counter port map (
            a => a
            b => b,
            clk => clk,
            q => q(0),
            andq => andq(0),
        );
        sync_cell1: sync_counter port map (
            a => andq(0),
            b => q(0),
            clk => clk,
            q => q(1)
        );
        sync_cell2: sync_counter port map (
            a => andq(1)
            b => q(1),
            clk => clk,
            q => q(2)
        );
end architecture circuit;

