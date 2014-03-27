-- author: Antonio Gutierrez
-- date: 03/10/13
-- description: dff with clk and clear
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity dff is
--generic declarations
    port (
        d1, d2, clk, rst, clr: in std_logic;
        q1, q2: out std_logic);
end entity dff;
--------------------------------------
architecture flipflops of dff is
--signals and declarations
begin
    ---- DFF figure 6.1(c)
    with_reset: process (clk, rst)
        --declarativepart
    begin
        if (rst = '1') then
            q1 <= '0';
        elsif (clk'event and clk = '1') then
            q1 <= d1;
        end if;
    end process with_reset;
    ---- DFF figure 6.1(e)
    with_clear: process (clk)
        --declarativepart
    begin
        if (clk'event and clk = '1') then
            if (clr = '1') then
                q2 <= '0';
            else 
                q2 <= d2;
            end if;
        end if;
    end process with_clear;
end architecture flipflops;
--------------------------------------

