------------------------------
library ieee;
use ieee.numeric_std.all;
------------------------------
entity multiplier is
--generic declarations
    port (
        a: in unsigned(3 downto 0) ;
        b: in unsigned(3 downto 0) ;
        y: out unsigned(7 downto 0) ;);
end entity;
------------------------------
architecture circuit of multiplier is
--signals and declarations
begin
    y <= a * b;
end architecture;
------------------------------

