--! 
--! @file: exercise5_14.vhd
--! @brief: Recommended Unsigned Adder/Substracter
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity unsigned_adder_substracter is
generic (N: integer := 5;);
    port (
        a, b: in std_logic_vector(N-1 downto 0); -- operands
        cin: in std_logic;                       -- cin
        sum, sub: out std_logic_vector(N downto 0)); -- result of sum of sub with their respectives cout
end entity unsigned_adder_substracter;
--------------------------------------
architecture circuit of unsigned_adder_substracter is
    signal a_un: unsigned(N-1 downto 0);
    signal b_un: unsigned(N-1 downto 0);
    signal sum_un: unsigned(N downto 0);
    signal sub_un: unsigned(N downto 0);
begin
    --------------------------------------
    a_un <= unsigned(a);
    b_un <= unsigned(b);
    --------------------------------------
    sum_un <= ('0' & a_un) + ('0' & b_un) + ('0' & cin);
    sub_un <= ('0' & a_un) - ('0' & b_un) + ('0' & cin);
    --------------------------------------
    sum <= std_logic_vector(sum_un);
    sub <= std_logic_vector(sub_un);
    --------------------------------------
end architecture circuit;
--------------------------------------


