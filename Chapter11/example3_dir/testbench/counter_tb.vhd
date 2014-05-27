--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: counter_tb.vhd
--! @brief: tb of counter
--! @author: Antonio Gutierrez
--! @date: 2014-05-23
--!
--!
--------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------
entity counter_tb is
    generic (PERIOD: time := 40 ns;
            PD: time := 3 ns);
end entity counter_tb;
--------------------------------------------------------
architecture circuit of counter_tb is


    --------------------------------------------------------
    -- component declaration
    --------------------------------------------------------
    component counter is
    port (
        clk, rst: in std_logic;
        output: out natural range 0 to 9);
    end component counter;

    
    --------------------------------------------------------
    -- signal declaration
    --------------------------------------------------------
    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '1';
    signal output_tb: natural range 0 to 9 := 0;
    

begin

    --------------------------------------------------------
    -- component instantiation
    --------------------------------------------------------
    dut: counter port map (
        clk => clk_tb,
        rst => rst_tb, 
        output => output_tb
    );

    
    --------------------------------------------------------
    -- stimuli generation
    --------------------------------------------------------

    -- rst
    process
    begin
        rst_tb <= '1';
        wait for PERIOD;
        rst_tb <= '0';
        wait;
    end process;

    -- clk
    clk_tb <= not clk_tb after PERIOD / 2;
    
    
    --------------------------------------------------------------------------------------
    -- stop simulation
    --------------------------------------------------------------------------------------
    process
    begin
        wait for PERIOD * 10;
        assert false
        report "simulation end"
        severity failure;
    end process;

end architecture circuit;


