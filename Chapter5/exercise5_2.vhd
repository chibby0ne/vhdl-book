--! 
--! @file: exercise5_2.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity dual_edge_ff is
--generic declarations
    port (
        d: in std_logic;
        clk: in std_logic;
        q: out std_logic);
end entity dual_edge_ff;
--------------------------------------
architecture circuit of dual_edge_ff is
    signal p: std_logic;
    signal r: std_logic;
    signal q_p: std_logic;
    signal q_r: std_logic;
begin
    -- positive edge flip flop
    p <= d when clk = '0' else p;
    q_p <= p when clk = '1' else q_p; 

    
    -- negative edge flip flop
    r <= d when clk = '1' else r;
    q_r <= r when clk = '0' else q_r;

    -- multiplexer for output
    q <= q_p when clk = '1' else q_r;

end architecture circuit;
--------------------------------------

-- according to the example 7.6 of book
architecture circuit1 of dual_edge_ff is
    signal q1: std_logic;
    signal q2: std_logic;
begin
    q1 <= d when clk = '1' else q1;
    q2 <= d when clk = '0' else q2;
    q <= q1 when clk = '0' else q2;
end architecture circuit;
--------------------------------------



