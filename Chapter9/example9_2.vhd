--! 
--! @file: example9_2.vhd
--! @brief: function in package
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
library work;
use work.my_package.all;
--------------------------------------
entity organizer is
generic (size: integer := 5);
    port (
        x: in unsigned(2 to 5);
        y: out unsigned(size-1 downto 0));
end entity organizer;
--------------------------------------
architecture circuit of organizer is
--signals and declarations
begin
    y <= order_and_fill(x, size);
end architecture circuit;
--------------------------------------
