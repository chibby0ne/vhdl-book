library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity and_gate is
--generic declarations
    port (
        a: in bit_vector(3 downto 0) ;
        b: in bit_vector(3 downto 0) ;
        x: out bit_vector(3 downto 0));
end entity;
------------------------------
architecture circuit of and_gate is
--signals and declarations
begin
    x <= a and b;
end architecture;
------------------------------

