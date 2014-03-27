--! 
--! @file: exercise9_3.vhd
--! @brief: function integer to slv
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity entityname is
--generic declarations
    port (
        in: in std_logic;
        out: out std_logic);
    function integer_to_slv(s : integer) return std_logic_vector is
    variable ss: integer := s;
    variable result: std_logic_vector(s'length-1 downto 0);
    begin
        for1: for i in result'reverse_range loop
            result(i) := ss mod 2;
            ss := ss / 2;
        end loop for1;
        return result;
    end function integer_to_slv;
end entity entityname;
--------------------------------------
architecture circuit of entityname is
--signals and declarations
begin
    --architecture_statements_part
end architecture circuit;
--------------------------------------

