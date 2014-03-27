--! 
--! @file: exercise5_16.vhd
--! @brief: Recommended signed Multiplier Implementation
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity signed_multiplier is
generic
    port (
        a, b: in std_logic_vector(4 downto 0);
        prod: out std_logic_vector(9 downto 0));
end entity signed_multiplier;
--------------------------------------
architecture circuit of signed_multiplier is
    signal a_un, b_un: signed(4 downto 0);
    signal prod_un: signed(9 downto 0);
begin
    --------------------------------------
    a_un <= signed(a);
    b_un <= signed(b);
    --------------------------------------
    prod_un <= a_un * b_un;
    --------------------------------------
    prod <= std_logic_vector(prod_un);
    --------------------------------------
end architecture circuit;
--------------------------------------


