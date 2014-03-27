--! 
--! @file: exercise6_8.vhd
--! @brief: Signal Generator
--! @author: Antonio Gutierrez
--! @date: 2013-10-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity signal_generator is
--generic declarations
    port (
        clk: in std_logic;          -- clk
        x, y: out std_logic);       --output
end entity signal_generator;
--------------------------------------
architecture circuit of signal_generator is
    signal even: std_logic := '0';
begin
    proc: process (clk)
    begin
        if (clk'event and clk = '1') then
            if (even = '0') then
                x <= clk;
                y <= '0';
            else
                x <= '0';
                y <= clk;
            end if;
            if (even = '0') then
                even <= '1';
            else 
                even <= '0';
            end if;
        end if;
    end process proc;
end architecture circuit;
--------------------------------------
architecture arch of signal_generator is
--signals and declarations
begin
    proc: process (clk)
        variable a, b: std_logic;
    begin
        if (clk'event and clk = '1') then
            a <= not a;
        else if (clk'event and clk = '0') then
            b <= not a;
        end if;
        x <= a and b;
        y <= a nor b;
    end process proc;
end architecture arch;
--------------------------------------
