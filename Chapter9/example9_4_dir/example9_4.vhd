--! 
--! @file: example9_4.vhd
--! @brief: procedure min_max in a package
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
library work;
use work.my_components.all;
--------------------------------------
entity comparator is
--generic declarations
    port (
        a, b, c: in integer range -256 to 255;
        min, max: out integer range -256 to 255);
end entity comparator;
--------------------------------------
architecture circuit of comparator is
--signals and declarations
begin
    min_max(a, b, c, min, max);
end architecture circuit;
--------------------------------------
