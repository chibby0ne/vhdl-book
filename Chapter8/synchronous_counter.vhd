--! 
--! @file: synchronous_counter.vhd
--! @brief: synchronous counter cell
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity sync_counter is
--generic declarations
    port (
        a, b, clk: in std_logic;
        andq, q: out std_logic);
end entity sync_counter;
--------------------------------------
architecture circuit of sync_counter is
    signal temp: std_logic;
begin
    temp <= a and b;
    ff: process (clk)
        variable q_ff: std_logic;
    begin
        if (clk'event and clk = '1') then
            q_ff := q_ff xor temp;
        end if;
    end process ff;
    q <= q_ff;
    andq <= temp;
end architecture circuit;
--------------------------------------
