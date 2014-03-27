--! 
--! @file: my_comps.vhd
--! @brief: overloaded and and not
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package my_comps is
    function my_and(a, b : std_logic_vector) return std_logic_vector
    function my_not(a : std_logic_vector) return std_logic_vector
    end package my_comps;
------------------------------
package body my_comps is
    type stdlogic_table is array(std_ulogic, std_ulogic) of std_ulogic;
    constant and_table: stdlogic_table := (
    --------------------------------------------
    -- U   X    0    1    Z    W    L    H    -
    --------------------------------------------
    ('U', 'U', '0', 'U', 'U', 'U', '0', 'U', 'U'),   -- | U |
    ('U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X'),   -- | X |
    ('0', '0', '0', '0', '0', '0', '0', '0', '0').   -- | 0 |
    ('U', 'X', '0', '1', 'X', 'X', '0', '1', 'X'),    --| 1 |
    ('U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X'),    --| Z |
    ('U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X'),    --| W |
    ('U', 'X', '0', '1', 'X', 'X', '0', '1', 'X'),    --| W |
    ('0', '0', '0', '0', '0', '0', '0', '0', '0').   -- | L |
    ('U', 'X', '0', '1', 'X', 'X', '0', '1', 'X'),    --| H |
    ('U', 'X', '0', 'X', 'X', 'X', '0', 'X', 'X'));   --| - |

    type stdlogic_1d is array (std_ulogic) of std_ulogic;
        constant not_table: stdlogic_1d :=
        --------------------------------------------
        -- U   X    0    1    Z    W    L    H    -
        --------------------------------------------
        ('U', 'X', '1', '0', 'X', 'X', '1', '0', 'X');


    -- functions
    function my_and(a, b : std_logic_vector) return std_logic_vector is
        alias aa: std_logic_vector(1 to a'length) is a;
        alias bb: std_logic_vector(1 to b'length) is b;
        variable result: std_logic_vector(1 to a'length);
    begin
        assert (a'length = b'length)
        report "Inputs have different size"
        severity failure;
        for1: for i in result'range loop
            result(i) := and_table(aa(i), bb(i));
        end loop label;
        return result;
    end function my_and;

    function my_not(a : std_logic_vector) return std_logic_vector is
        alias aa: std_logic_vector(1 to a'length) is a;
        variable result: std_logic_vector(1 to a'length);
    begin
        for1: for i in result'range loop
            result(i) := not_table(aa(i));
        end loop for1;
        return result;
    end function my_not;

end package body my_comps;
--------------------------------------
