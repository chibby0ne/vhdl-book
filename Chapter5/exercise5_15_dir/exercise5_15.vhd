--! 
--! @file: exercise5_15.vhd
--! @brief: Recommended Unsigned Multiplier Implementation
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity unsigned_multiplier is
generic
    port (
        a, b: in std_logic_vector(4 downto 0);
        prod: out std_logic_vector(9 downto 0));
end entity unsigned_multiplier;
--------------------------------------
architecture circuit of unsigned_multiplier is
    signal a_un, b_un: unsigned(4 downto 0);
    signal prod_un: unsigned(9 downto 0);
begin
    --------------------------------------
    a_un <= unsigned(a);
    b_un <= unsigned(b);
    --------------------------------------
    prod_un <= a_un * b_un;
    --------------------------------------
    prod <= std_logic_vector(prod_un);
    --------------------------------------
end architecture circuit;
--------------------------------------


