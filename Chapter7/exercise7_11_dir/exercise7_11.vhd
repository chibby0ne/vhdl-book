--! 
--! @file: exercise7_9.vhd
--! @brief:  frequency divider with symmetric phase
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
        
        -- if M is even
        if (M % 2 = 0) then
            if (clk'event and clk = '1') then
                counter := counter + 1;
                if (counter = M/2) then             -- if we reach the middle of the cycle flip bit
                    clkout <= '1';                  
                elsif (counter = M) then            -- if we reach full cycle flip bit again and reset count
                    counter := 0;
                    clkout <= '0';
                end if;
            end if;
        else 
            -- if M is odd
            if (clk'event) then
                if (clk = '1') then         -- if it is a rising edge, increment count
                    counter := counter + 1;
                    if (counter = M) then       -- check if we reached M then reset count and flip output
                        counter := 0;
                        clkout <= '0';
                    end if;
                elsif (clk = '0' and counter = M/2) then        -- if it's falling edge and counter is half way (we are in the middle of the cycle), flip output
                    clkout <= '1';          
                end if;
            end if;
       end if;
    end process proc;
end architecture circuit;
--------------------------------------
