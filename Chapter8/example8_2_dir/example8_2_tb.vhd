--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: example8_2_tb.vhd
--! @brief: testbench for circular shift register with component
--! @author: Antonio Gutierrez
--! @date: 2014-04-10
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------

entity circular_shift_tb is
end entity circular_shift_tb;
--------------------------------------

architecture circuit of circular_shift_tb is

-- dut declaration
    component circular_shift is
    port (
        clk, load: in bit;
        d: in bit_vector(0 to 3);
        q: buffer bit_vector(0 to 3));
    end component circular_shift;

    
    -- signal declarations
    signal clk_tb: bit := '0';
    signal load_tb: bit := '1';
    signal d_tb: bit_vector(0 to 3) := "0110";
    signal q_tb: bit_vector(0 to 3);
begin
    
    -- dut instantiation
    dut: circular_shift port map (
    clk_tb, load_tb, d_tb, q_tb
    );

    -- stimuli generation
    -- clk
    clk_tb <= not clk_tb after 20 ns;

    -- load
    load_tb <= '0' after 21 ns, '1' after 200 ns, '0' after 221 ns;

    -- d_tb
    d_tb <= "1001" after 200 ns, "0000" after 221 ns;

end architecture circuit;

