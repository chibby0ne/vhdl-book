-- problem with this approach is that the nature of the operation is not
-- explicitly shown in code (it depends on the package used (signed or 
-- unsigned)
------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
------------------------------
entity multiplier is
--generic declarations
    port (
        a: in std_logic_vector(3 downto 0) ;
        b: in std_logic_vector(3 downto 0) ;
        y: out std_logic_vector(7 downto 0) ;);
end entity;
------------------------------
architecture circuit of multiplier is
--signals and declarations
begin
    y <= a * b;
end architecture;
------------------------------


