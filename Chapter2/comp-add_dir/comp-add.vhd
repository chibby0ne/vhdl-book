------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity comp_add is
    port (a: in integer range 0 to 7; 
        comp: out std_logic;
        sum: out integer range 0 to 15;);
end entity;
------------------------------
architecture comp_add of comp_add is
begin
    comp <= '1' when a > b else '0';
    sum <= a + b;
end architecture;
