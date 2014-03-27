--! 
--! @file: exercise5_12.vhd
--! @brief: Barrel Shifter with integer and bit_vector
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity barrel_shifter is
generic (N: integer := 8;
        M: integer := 3);
    
    port (
        x: in bit_vector(N-1 downto 0);
        shift: in integer range 0 to (2**M)-1;
        y: out bit_vector(N-1 downto 0));
end entity barrel_shifter;
--------------------------------------
architecture circuit of barrel_shifter is
begin
    with shift select
        y <= x when 0,
        x srl shift when others;
end architecture circuit;
--------------------------------------

