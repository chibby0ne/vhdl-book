--! 
--! @file: exericse7_3.vhd
--! @brief: latches and flip flop
--! @author: Antonio Gutierrez
--! @date: 2013-10-29
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity test is
--generic declarations
    port (
        d, clk, rst: in std_logic;
        q: out std_logic);
end entity test;
--------------------------------------
architecture circuit of test is
--signals and declarations
begin
    ----code 1:----------------------------------
    proc: process (d, clk, rst)
        --declarativepart
    begin
        if (rst = '1') then
            q <= '0';
        elsif (clk = '1') then
            q <= d
        end if;
    end process proc;
    ----code 2:-----------------------------------
    proc2: process (clk)
        --declarativepart
    begin
        if (clk'event and clk = '1') then
            if (rst = '1') then
                q <= '0';
            else
                q <= d;
            end if;
        end if;
    end process proc2;
    ----code 3:----------------------------------
    proc3: process (clk)
        --declarativepart
    begin
        if (clk = '1') then
            if (rst = '1') then
                q <= '0';
            else
                q <= d;
            end if;
        end if;
    end process proc3;
    --------------------------------------------
end architecture circuit;
