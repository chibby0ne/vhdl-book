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
        clk: in std_logic;
        reg_z: out std_logic);
end entity;
------------------------------
architecture circuit of circuit is
    signal z: std_logic;
begin
    z <= a xor ((a nand b) or c);
    process (clk)
    begin
        if (clk'event and clk = '1') then
            reg_z <= z;
        end if;
    end process;
end architecture;
------------------------------
