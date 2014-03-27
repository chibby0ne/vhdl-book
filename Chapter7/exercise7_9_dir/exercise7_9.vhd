--! 
--! @file: exercise7_9.vhd
--! @brief:  frequency divider with variable
--! @author: Antonio Gutierrez
--! @date: 2013-10-29
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity freq_divider is
    generic (M: integer := 4;);
    port (
        clkin: in std_logic;
        clkout: out std_logic);
end entity freq_divider;
--------------------------------------
architecture circuit of freq_divider is
--signals and declarations
begin
    proc: process (clk)
        variable counter: integer range 0 to M := 0;
    begin
        if (clk'event and clk = '1') then
            counter := counter + 1;
            if (counter = M/2) then
                clkout <= '1';
            elsif (counter = M) then
                counter := 0;
                clkout <= '0';
            end if;
        end if;
    end process proc;
end architecture circuit;
--------------------------------------
