--! 
--! @file: exercise5_13.vhd
--! @brief: barrel shifter with std_logic_vector
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
        x: in std_logic(N-1 downto 0);
        shift: in std_logic_vector(M-1 downto 0);
        y: out std_logic_vector(N-1 downto 0));
end entity barrel_shifter;
--------------------------------------
architecture circuit of barrel_shifter is
signal shift_uns: unsigned;
begin
    shift_uns <= unsigned(shift);
    with shift_uns select
        y <= x when 0,
             x rol shift_uns when others;
end architecture circuit;
--------------------------------------


