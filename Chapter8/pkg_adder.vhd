--! 
--! @file: pkg_adder.vhd
--! @brief: package that holds full adder
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package pkg_adder is
    component full_adder is
        port (
        a, b: std_logic;
        cin: in std_logic;
        s: out std_logic;
        cout: out std_logic);
    end component full_adder;
end package pkg_adder;
------------------------------
package body pkg_adder is
    --functionsdefinitions, deferredconstants. they need to have the full subprogram header exactly as it appears in package
end package body pkg_adder;
