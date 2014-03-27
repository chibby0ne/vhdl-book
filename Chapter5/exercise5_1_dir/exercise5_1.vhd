-- author: Antonio Gutierrez
-- date: 09/10/13
-- description: 
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity ent is
--generic declarations
    port (
        x: in std_logic_vector(2 downto 0);
        y: out std_logic_vector(1 downto 0));
end entity;
--------------------------------------
architecture circuit of ent is
--signals and declarations
begin
    y(0) <= '1' when not x(2) or (x(1) and x(0) 
            else '0';);
    y(1) <= '1' when x(1) 
            else '0';
-- with x select
--    y <= "01" when "0--",
--        <= "10" when "11-",
--        <= "00" when others;
end architecture;
--------------------------------------

