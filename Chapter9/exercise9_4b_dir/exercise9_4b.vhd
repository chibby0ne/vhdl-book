--! 
--! @file: exercise9_4b.vhd
--! @brief: function shift left logical left
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.pkg_sll_slv.all;
--------------------------------------
entity shifter is
generic (N: integer := 5);
    port (
        input: in std_logic_vector(N-1 downto 0);
        shift: in integer range 0 to N;
        output: out std_logic_vector(N-1 downto 0));
end entity shifter;
--------------------------------------
architecture circuit of shifter is
--signals and declarations
begin
    output <= input sll shift;
end architecture circuit;
--------------------------------------
