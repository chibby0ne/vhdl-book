--! 
--! @file: exercise6_12.vhd
--! @brief: Programmable Signal Generator
--! @author: Antonio Gutierrez
--! @date: 2013-10-28
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity programmable_signal_generator is
generic (fclk: integer := 50_000_000;);     -- clock frequency
    port (
        clk: in std_logic;
        freq: in std_logic;
        sig_out: out std_logic);
end entity programmable_signal_generator;
--------------------------------------
architecture circuit of programmable_signal_generator is
    signal desired_freq: integer 0 to 10000;
    signal pulses: integer 0 to fclk / 1000;
begin
    
    -- selecting the frequcny and the number of pulses required for that frequency
    proc1: process (freq)
    begin
        if (freq'event and freq = '1') then
            if (desired_freq = 10000) then
                desired_freq <= 1000;
            else
                desired_freq <= desired_freq + 1000;
            end if;
            pulses <= fclk / desired_freq;
        end if;
    end process proc1;

    
    -- outputing and counting the pulses
    proc: process (clk)
        variable count: integer 0 to fclk;
        variable output: std_logic := '0'
    begin
        if (clk'event and clk = '1') then
            count := count + 1;
            if (count = pulses) then
                count := 0;
                output := not output;
            end if;
        end if;
        sig_out <= output;
    end process proc;
end architecture circuit;
--------------------------------------


