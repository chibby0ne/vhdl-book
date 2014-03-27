--! 
--! @file: exercise6_11.vhd
--! @brief: Frequency Meter with SSDs
--! @author: Antonio Gutierrez
--! @date: 2013-10-28
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity frequency_meter is
    generic (fclk: positive := 50_000_000;
            clk_divider: positive := 50_000);
    port (
        input: in std_logic;                        -- signal to measure
        clk: in std_logic;                          -- clk
        ssd1: out std_logic_vector(6 downto 0);
        ssd2: out std_logic_vector(6 downto 0);
        ssd3: out std_logic_vector(6 downto 0));
end entity frequency_meter;
--------------------------------------
architecture circuit of frequency_meter is
    signal one_sec: std_logic;
    signal output1: integer range 0 to 10;
    signal output2: integer range 0 to 10;
    signal output3: integer range 0 to 10;
begin

    -- create one second window
    proc: process (clk)
        variable one_sec: integer range 0 to fclk+1 := 0;
    begin
        if (clk'event and clk = '1') then
            count := count + 1;
            if (count = fclk + 1) then
                count := 0;
                one_sec <= '1';
            else
                one_sec <= '0';
            end if;
        end if;
    end process proc;


    -- count number of input pulses in that time window
    proc1: process (input, one_sec)
        variable count1: integer range 0 to 10;
        variable count2: integer range 0 to 10;
        variable count3: integer range 0 to 10;
        variable count4: integer range 0 to 10;
        variable count5: integer range 0 to 10;
    begin
        if (one_sec = '1') then
            count1 := 0;
            count2 := 0;
            count3 := 0;
            count4 := 0;
            count5 := 0;
        elsif (input'event and input = '1') then
            count1 := count1 + 1;
            if (count1 = 10) then
                count1 := 0;
                count2 := count2 + 1;
                if (count2 = 10) then
                    count2 := 0;
                    count3 := count3 + 1;
                    if (count3 = 10) then
                        count3 := 0;
                        count4 := count4 + 1;
                        if (count4 = 10) then
                            count4 := 0;
                            count5 := count5 + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
        -- store outputs to SSD
        if (one_sec'event and one_sec = '1') then
            output1 <= count5;
            output2 <= count4;
            output3 <= count3;
        end if;
    end process proc1;
    -- SSD circuits
    with output1 select
        ssd1 <= '0000000' when 0,
                '0000001' when 1,
                '0000001' when 2,
                '0000001' when 3,
                '0000001' when 4,
                '0000001' when 5,
                '0000001' when 6,
                '0000001' when 7,
                '0000001' when 8,
                '0000001' when others;
    with output2 select
        ssd2 <= '0000000' when 0,
                '0000001' when 1,
                '0000001' when 2,
                '0000001' when 3,
                '0000001' when 4,
                '0000001' when 5,
                '0000001' when 6,
                '0000001' when 7,
                '0000001' when 8,
                '0000001' when others;

    with output3 select
        ssd3 <= '0000000' when 0,
                '0000001' when 1,
                '0000001' when 2,
                '0000001' when 3,
                '0000001' when 4,
                '0000001' when 5,
                '0000001' when 6,
                '0000001' when 7,
                '0000001' when 8,
                '0000001' when others;

end architecture circuit;
--------------------------------------


