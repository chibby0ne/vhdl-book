------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity registered_comp_add is
    port (clk: in std_logic;
         a, b: in integer range 0 to 7;
         reg_comp: out std_logic;
         reg_sum: out integer range 0 to 15;);
end entity;
------------------------------
architecture circuit of registered_comp_add is
    signal comp: std_logic;
    signal sum: integer range 0 to 15;
begin
    comp <= '1' when a > b else '0';
    sum <= a + b;
    process (clk, rst)
    begin
        if (clk'event and clk = '1') then
            reg_comp <= comp;
            reg_sum <= sum;
        end if;
    end process
end architecture;
