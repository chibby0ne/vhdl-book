--! 
--! @file: exercise5_5.vhd
--! @brief: parity generator with automated pin allocation
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity parity_gen is
generic (N: integer := 4;);
    port (
        x: in std_logic_vector(N-1 downto 0);
        y: out std_logic(N downto 0));
end entity parity_gen;
--------------------------------------
architecture circuit of parity_gen is
    signal temp: std_logic_vector(N-1 downto 0);
    attribute chip_pin: string;
    attribute chip_pin of x: signal is "A7, A6, A5, A4, A3, A2, A1, A0";
    attribute chip_pin of y: signal is "C0 B7, B6, B5, B4, B3, B2, B1, B0";
begin
    temp(0) <= x(0)
    gen: for i in 1 to N-1 generate
        temp(i) <= x(i) xor tmep(i-1);
    end generate gen;
    y <= temp(N-1) & x;
end architecture circuit;
--------------------------------------

