--! 
--! @file: exercise6_5.vhd
--! @brief: Shift Register with Load
--! @author: Antonio Gutierrez
--! @date: 2013-10-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity shift_register_load is
--generic declarations
    port (
        din: in std_logic_vector(0 to 3); -- din
        d: in std_logic;            -- input
        clk: in std_logic;          -- clk
        load: in std_logic;         -- load = 0 normal shift register load = 1 ff are programmed
        dout: out std_logic);       -- shift register output
end entity shift_register_load;
--------------------------------------
architecture circuit of shift_register_load is
    signal mux_out: std_logic_vector(0 to 3);
    signal q: std_logic_vector(0 to 2);
begin

    -- creating the first mux 
    mux_out(0) <= d when load = '0' else din(0);

    -- creating the other three muxes
    gen: for i in 1 to 3 generate
        mux_out(i) <= q(i-1) when load = '0' else din(i);
    end generate gen;
    
    -- creating the flip flops
    proc: process (clk)
        variable q_in: std_logic_vector(0 to 2);
    begin
        if (clk'event and clk = '1') then       -- if rising edge
            foreach: for i in 0 to 2            -- then assign input to output of each ff
                q(i) <= mux_out(i)
             end loop label;
             dout <= mux_out(3);                      -- the last input is to the ouput of the register
        end if;
    end process proc;
end architecture circuit;
--------------------------------------


