--! 
--! @file: exercise5_17.vhd
--! @brief: Unsigned Divider Implementation
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity unsigned_divider is
generic
    port (
        a, b: in std_logic_vector(4 downto 0);
        div: out std_logic_vector(4 downto 0));
end entity unsigned_divider;
--------------------------------------
architecture circuit of unsigned_divider is
    signal a_un: unsigned(4 downto 0);
    signal b_un: unsigned(4 downto 0);
    signal div_un: unsigned(4 downto 0);
begin
    --------------------------------------
    a_un <= unsigned(a);
    b_un <= unsigned(b);
    --------------------------------------
    div_un <= a_un / b_un;
    --------------------------------------
    div <= std_logic_vector(div_un);
    --------------------------------------
end architecture circuit;
--------------------------------------


