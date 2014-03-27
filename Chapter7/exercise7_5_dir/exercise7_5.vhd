--! 
--! @file: exericse7_5.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2013-10-29
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity slow_counter is
generic (fclk: integer := 50_000_000);
    port (
        clk, rst: in std_logic;
        ssd: out std_logic_vector(6 downto 0));
end entity slow_counter;
--------------------------------------
architecture counter of slow_counter is
--signals and declarations
begin
    proc: process (clk, rst)
        variable counter1: natural range 0 to fclk := 0;
        variable counter2: natural range 0 to 10 := 0;
    begin

        -- counter:
        if (rst = '1') then
            counter1 := 0;
            counter2 := 0;
        elsif (clk'event and clk = '1') then
            counter1 := counter1 + 1;
            if (counter1 := fclk) then
                counter1 := 0;
                counter2 := counter2 + 1;
                if (counter2 = 10) then
                    counter := 0;
                end if;
            end if;

            -- SSD driver:
            ssdriver: case counter2 is
                when 0 => ssd <= "0000001";
                when 1 => ssd <= "1011111";
                when 2 => ssd <= "0010010";
                when 3 => ssd <= "0000110";
                when 4 => ssd <= "1001100";
                when 5 => ssd <= "0100100";
                when 6 => ssd <= "0100000";
                when 7 => ssd <= "0001111";
                when 8 => ssd <= "0000000";
                when 8 => ssd <= "0000100";
                when others => ssd <= "0110000";
            end case ssdriver;
        end if;
    end process proc;
end architecture counter;
--------------------------------------

