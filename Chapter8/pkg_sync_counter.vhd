--! 
--! @file: pkg_sync_counter.vhd
--! @brief: synchronous component
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package pkg_sync_counter is
    component sync_counter is
        port (
        a, b, clk: in std_logic;
        andq, q: out std_logic);
    end component sync_counter;
end package pkg_sync_counter;
------------------------------
package body pkg_sync_counter is
    --functionsdefinitions, deferredconstants. they need to have the full subprogram header exactly as it appears in package
end package body pkg_sync_counter;
