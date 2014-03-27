--! 
--! @file: exercise8_6.vhd
--! @brief: synchronous counter with component and genrate
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
entity 32_sync_counter is
    generic (N: integer := 32);
    port (
        a, b, clk: in std_logic;
        q: out std_logic_vector(N-1 downto 0));
end entity sync_counter;
--------------------------------------
architecture circuit of 32_sync_counter is
    signal q_and: std_logic_vector(N-1 downto 0);
    signal q_temp: std_logic_vector(N-1 downto 0);
begin
    sync0: sync_counter port map (
        a => a,
        b => b,
        clk => clk,
        andq => q_and(0),
        q => q_temp(0)
    );
    gen1: for i in 1 to N-1 generate
        sync: sync_counter port map (
            a => and_q(i-1),
            b => q_temp(i-1),
            clk => clk,
            andq => q_and(i),
            q => q_temp(i),
        );
    end generate gen1;
    q <= q_temp(i);
end architecture circuit;
--------------------------------------
