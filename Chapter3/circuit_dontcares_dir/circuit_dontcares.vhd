------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity circuit is
--generic declarations
    port (
        x: in std_logic_vector(1 downto 0) ;
        y: out std_logic_vector(1 downto 0) );
end entity;
------------------------------
architecture circuit of circuit is
--signals and declarations
begin
    y <= "00" when x = "00" else
         "10" when x = "01" else
         "01" when x = "10" else
         "--";
end architecture;
------------------------------

