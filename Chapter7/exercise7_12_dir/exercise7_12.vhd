--! 
--! @file: exercise7_12.vhd
--! @brief: generic and with concurrent code
--! @author: Antonio Gutierrez
--! @date: 2013-10-29
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity generic_and is
generic (N: integer := 5);
    port (
        x: in std_logic_vector(N-1 downto 0);
        y: out std_logic);
end entity generic_and;
--------------------------------------
architecture circuit of generic_and is
    type matrix is array (0 to N-1) of std_logic;
    signal temp: matrix;
begin
    temp(0) <= x(0);
    gen: for i in 1 to N-1 generate
        temp(i) <= temp(i-1) and x(i);
    end generate gen;
    y <= temp(N-1);
end architecture circuit;
--------------------------------------
