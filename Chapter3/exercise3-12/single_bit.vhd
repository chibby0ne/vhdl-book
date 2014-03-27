------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity and_gate is
--generic declarations
    port (
        a: in bit ;
        b: in bit ;
        x: out bit);
end entity;
------------------------------
architecture circuit of and_gate is
--signals and declarations
begin
    x <= a and b;
end architecture;
------------------------------

