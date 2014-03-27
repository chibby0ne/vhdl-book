------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity circuit is
--generic declarations
    port (
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        z: out std_logic);
end entity;
------------------------------
architecture circuit of circuit is
    --signal x: std_logic;
    --signal y: std_logic;
begin
    z <= a xor ((a nand b) or c);
end architecture;
------------------------------
