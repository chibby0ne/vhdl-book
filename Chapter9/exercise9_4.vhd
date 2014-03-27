--! 
--! @file: pkg_sll_slv.vhd
--! @brief: fucntion shift logical left
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package pkg_sll_slv is
    function "sll"(slv : std_logic_vector; shift : integer) return std_logic_vector
    end package pkg_sll_slv;
------------------------------
package body pkg_sll_slv is
    function "sll"(slv : std_logic_vector; shift : integer) return std_logic_vector is
        variable result: std_logic_vector(slv'left downto 0);
    begin
        if (shift > 0) then
            result(result'left downto shift) := slv(slv'left - shift downto 0);
            result(shift-1 downto 0) := (others => '0');
        else
            result(result'left-shift downto 0) := slv(slv'left downto shift);
            result(result'left downto result'left-shift) := (others => '0');
        end if;
        return result;
    end function shift_logical_left;
end package body pkg_sll_slv;
--------------------------------------
