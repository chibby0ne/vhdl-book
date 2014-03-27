--! 
--! @file: example9_1.vhd
--! @brief: function max in an architecture
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity comparator is
--generic declarations
    port (
        a, b, c: in integer range 0 to 255;
        y: out integer range 0 to 255);
end entity comparator;
--------------------------------------
architecture circuit of comparator is
    function max(in1, in2, in3 : integer) return boolean is
    begin
        -- check that in-out signal ranges coincide
        assert (y'left = a'left and y'left = b'left and y'left = c'left and y'right = a'right and y'right = b'right and y'right = c'right)
        -- find maximum
        if (in1 >= in2 and in1 >= in3) then
            return in1;
        elsif (in2 >= in1 and in2 >= in3) then
            return in2;
        else
            return in3;
        end if;
    end function max;
begin
    y <= max(a, b, c);
end architecture circuit;
--------------------------------------

