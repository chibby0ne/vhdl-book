-- author: Antonio Gutierrez
-- date: 03/10/13
-- description: basic counter
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity counter is
--generic declarations
    port (
        clk: in std_logic;
        count: out integer range 0 to 9);
end entity counter;
--------------------------------------
architecture counter of counter is
--signals and declarations
begin
    counting: process (clk)
        variable temp: integer range 0 to 10;
    begin
        if (clk'event and clk = '1') then
            temp := temp + 1;
            if (temp = 10) then
                temp := 0;
            end if;
        end if;
        count <= temp;
    end process counting;
end architecture counter;
--------------------------------------

