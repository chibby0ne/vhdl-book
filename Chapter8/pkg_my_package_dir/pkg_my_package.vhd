--! 
--! @file: pkg_my_package.vhd
--! @brief: my package page 203
--! @author: Antonio Gutierrez
--! @date: 2013-11-21
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package my_package is
    constant flag: std_logic;
    function down_edge(signal s : std_logic) return boolean
end package my_package;
------------------------------
package body my_package is
    constant flag: std_logic := '1';
    function down_edge(signal s : std_logic) return boolean is
        --declarative part
    begin
        return (s'event and s = '0')
    end function down_edge;
end package body my_package;
--------------------------------------
