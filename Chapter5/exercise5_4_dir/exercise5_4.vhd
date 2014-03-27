--! 
--! @file: exercise5_4.vhd
--! @brief: generic parity generator using concurrent code
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
generic (N: integer := 5;);
    port (
        x: in std_logic_vector(N-1 downto 0);
        y: out std_logic_vector(N downto 0));
end entity parity_gen;
--------------------------------------
architecture circuit of parity_gen is
    signal temp: std_logic_vector(N-1 downto 0);
begin
    
    -- initialize temp
    temp(0) <= x(0);
    
    -- xor of all the bits of the vector
    gen: for i in 1 to N-1 generate
        temp(i) <= x(i) xor temp(i-1);
    end generate gen;
    
    -- output is the last bit of temp
    y <= temp(N-1) & x;
end architecture circuit;
--------------------------------------

