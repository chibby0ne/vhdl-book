--! 
--! @file: exercise9_5.vhd
--! @brief: function my_not 
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
library work;
use work.my_comps.all;

--------------------------------------
entity app_and is
--generic declarations
    port (
        a, b: in std_logic;
        q: out std_logic);
end entity app_notand;
--------------------------------------
architecture circuit of app_notand is
--signals and declarations
begin
    q <= my_and a;
end architecture circuit;
--------------------------------------
