--! 
--! @file: mux.vhd
--! @brief: multiplexer
--! @author: Antonio Gutierrez
--! @date: 2013-11-26
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity mux is
--generic declarations
    port (
        a, b, sel: in std_logic;
        x: out std_logic);
end entity mux;
--------------------------------------
architecture circuit of mux is
--signals and declarations
begin
    x <= a when sel = '0' else b;
end architecture circuit;
--------------------------------------

