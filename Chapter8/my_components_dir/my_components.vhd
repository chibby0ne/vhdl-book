--! 
--! @file: my_components.vhd
--! @brief: components
--! @author: Antonio Gutierrez
--! @date: 2013-11-26
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
package my_components is
    type twoD is array (natural range <>, natural range <>) of std_logic;
    --------------------------------------
    component mux is
        port (
            a, b, sel: in std_logic;
            x: out std_logic);
    end component mux;
    --------------------------------------
    component flipflop is
        port (
            d, clk: in std_logic;
            q: out std_logic);
    end component flipflop;
    --------------------------------------
end package my_components;


------------------------------
package body my_components is
    --functionsdefinitions, deferredconstants. they need to have the full subprogram header exactly as it appears in package    
end package body my_components;
