-- author: Antonio Gutierrez
-- date: 09/10/13
-- description: exercise 1: Latch and Flip Flop
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity flip_flop_latch is
--generic declarations
    port (
        d: in std_logic;
        clk: in std_logic;
        q1, q2: out std_logic);
end entity flip_flop_latch;
--------------------------------------
architecture circuit of flip_flop_latch is
--signals and declarations
begin
    -------------------
    ---- flip flop
    -------------------
    flip_flop: process (clk)
        --declarativepart
    begin
        if (clk'event and clk = '1') then
            q1 <= d;
        end if;
    end process flip_flop;
    -------------------
    ---- latch
    -------------------
    latch: process (clk, d)
        --declarativepart
    begin
        if (clk = '1') then
            q2 <= d;
        end if;
    end process latch;
end architecture circuit;
--------------------------------------
