--! 
--! @file: tapped_delay.vhd
--! @brief: tapped delay line cell
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity tapped_delay_cell is
generic (N: integer := 2;
         M: integer := 4);
    port (
        d: in std_logic_vector(N-1 downto 0);
        sel: in std_logic;
        rst, clk: in std_logic;
        q: out std_logic_vector(N-1 downto 0));
end entity tapped_delay_cell;
--------------------------------------
architecture circuit of tapped_delay_cell is
    signal q_sr: std_logic(N-1 downto 0);
begin


    q <= d when sel = '0' else q_sr;
end architecture circuit;

