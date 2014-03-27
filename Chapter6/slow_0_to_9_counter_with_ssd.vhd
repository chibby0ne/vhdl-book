-- author: Antonio Gutierrez
-- date: 08/10/13
-- description: ssd display and ssd driver
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity slow_counter is
generic (fclk: integer := 50_000_000;); ---- 50Mhz
    port (
        clk, rst: in bit;
        ssd: out bit_vector(6 downto 0);
end entity slow_counter;
--------------------------------------
architecture counter of slow_counter is
--signals and declarations
begin
    counter: process (clk, rst)
        variable counter1: natural range 0 to fclk := 0;
        variable counter2: natural range 0 to 10 := 0;
    begin
        -------------------
        ---- counter
        -------------------
        if (rst = '1') then
            counter1 := 0;
            counter2 := 0;
        elsif (clk'event and clk = '1') then
            counter1 := counter1 + 1;
            if (counter1 = fclk) then
                counter1 := 0;
                counter2 := counter2 + 1;
                if (counter2 = 10) then
                    counter2 := 0;
                end if;
            end if;
        end if;
        -------------------
        ---- SSD driver:
        -------------------
        ssddriver: case counter2 is
            when 0 => ssd <= "0000000"; ---- "0" in SSD
            when 1 => ssd <= "1001111"; ---- "1' in SSD
            when 2 => ssd <= "0010010"; ---- "2' in SSD
            when 3 => ssd <= "0000110"; ---- "3' in SSD
            when 4 => ssd <= "1001100"; ---- "4' in SSD
            when 5 => ssd <= "0100100"; ---- "5' in SSD
            when 6 => ssd <= "0100000"; ---- "6' in SSD
            when 7 => ssd <= "0001111"; ---- "7' in SSD
            when 8 => ssd <= "0000000"; ---- "8' in SSD
            when 9 => ssd <= "0000100"; ---- "9' in SSD
            when others => ssd <= "0110000"; ---- "E' in SSD
        end case ssddriver;
    end process counter;
end architecture counter;
--------------------------------------

