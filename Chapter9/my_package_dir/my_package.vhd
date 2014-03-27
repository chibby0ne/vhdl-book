--! 
--! @file: my_package.vhd
--! @brief: example9_2 
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package my_package is
    function order_and_fill(input : unsigned; bits: natural) return unsigned
end package my_package;
------------------------------
package body my_package is

    function order_and_fill(input : unsigned; bits: natural) return unsigned is
        variable a: unsigned(input'length-1 downto 0);
        variable result: unsigned(bits-1 downto 0);
    begin
        -- check input size
        assert (input'length <= bits)
        report "Improper input size!"
        severity failure;
        -- organize input
        if (input'left > input'right) then
            a := input;
        else
            for1: for i in a'range loop
                a(i) := input(input'left + i);
            end loop for1;
        end if;
        -- fill with zeros
        if (a'length < bits) then
            result(bits-1 downto a'length) := (others => '0');
            result(a'length-1 downto 0) := a;
        else
            result := a;
        end if;
        return result;
    end function order_and_fill;

end package body my_package;
