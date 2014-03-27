--! 
--! @file: exercise6_9.vhd
--! @brief: switch debouncer
--! @author: Antonio Gutierrez
--! @date: 2013-10-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity switch_debouncer is
    generic (FCLK: integer := 50;           -- clock frequency in MHZ
             twindow: integer := 10);        -- time window in ms
    port (
        sw: in std_logic;
        clk: in std_logic;
        deb_sw: buffer std_logic);
end entity switch_debouncer;
--------------------------------------
architecture circuit of switch_debouncer is
    constant max: integer := 50 * 10 * 1000;        -- number of clock periods there are in 10ms
begin
    proc: process (clk)
        variable count: integer 0 to max;       -- keeps count of how many clicks
    begin
        if (clk'event and clk = '1') then       -- if there was a rising edge
            if (deb_sw /= sw) then              -- if there was a change in the switch, increment count
                count <= count + 1;             
                if (count = max) then           -- if 10ms passed
                    deb_sw <= sw;               -- assign input to output and reset count
                    count <= 0;                 
                end if;
            else                                -- if there isn't any change in the switch then just reset the count
                count := 0;
            end if;
        end if;
    end process proc;
end architecture circuit;
--------------------------------------

