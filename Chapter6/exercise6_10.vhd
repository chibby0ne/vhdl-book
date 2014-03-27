--! 
--! @file: exercise6_10.vhd
--! @brief: two digit timer
--! @author: Antonio Gutierrez
--! @date: 2013-10-28
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity two_digit_timer is
    generic (fclk: integer := 50_000_000);          -- clock freq in Mhz
    port (
        rst: in std_logic;
        ena: in std_logic;
        clk: in std_logic;
        full_count: out std_logic;
        ssd1: out std_logic_vector(3 downto 0);
        ssd2: out std_logic_vector(2 downto 0));
end entity two_digit_timer;
--------------------------------------
architecture circuit of two_digit_timer is
begin
    
    -- counter with its inputs and outputs
    proc: process (clk, rst)
        variable count: integer range 0 to fclk := 0;       -- used to know when a second has passed
        variable count1: integer range 0 to 9 := 0;         -- units
        variable count2: integer range 0 to 6 := 0;         -- decens
        variable full: boolean := false;
    begin
        if (rst = '1') then
            count1:= 0;
            count2:= 0;
            full := false;
        elsif (ena = '1' and clk'event and clk = '1') then  -- rising edge and ena asserted?
            count := count + 1;                             -- then increment count of clock periods
            if (count = fclk) then                          -- completed a second?
                count := 0;                                 
                if (full /= true) then                      -- haven't reached 60?
                    count1 := count1 + 1;                   -- then increment units
                    if (count1 = 10) then                   -- units more than 9?
                        count1 := 0;                        -- then reset units and increment decens
                        count2 := count2 + 1;
                        if (count2 = 6) then                -- decens = 60?
                            full := true;                   -- flag completion of count
                        end if;
                    end if;
                end if;
            end if;
        end if;

    -- SSD drivers
        digit1: case count1 is
            when 0 => ssd1 <= "0000000";
            when 1 => ssd1 <= "0000000";
            when 2 => ssd1 <= "0000000";
            when 3 => ssd1 <= "0000000";
            when 4 => ssd1 <= "0000000";
            when 5 => ssd1 <= "0000000";
            when 6 => ssd1 <= "0000000";
            when 7 => ssd1 <= "0000000";
            when 8 => ssd1 <= "0000000";
            when others => ssd1 <= "0000000";
        end case digit1;
        digit2: case count2 is
            when 0 => ssd2 <= "0000000";
            when 1 => ssd2 <= "0000000";
            when 2 => ssd2 <= "0000000";
            when 3 => ssd2 <= "0000000";
            when 4 => ssd2 <= "0000000";
            when 5 => ssd2 <= "0000000";
            when others => ssd2 <= "0000000";
        end case digit2;
    end process proc;

    full_count = '1' when full = '1' else '0';

end architecture circuit;
--------------------------------------
