--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity vending_machine_tb is
end entity vending_machine_tb;
--------------------------------------
architecture circuit of vending_machine_tb is
    
    -- dut declaration
    component vending_machine is
    port (
        clk, rst: in std_logic;
        nickel_in, dime_in, quarter_in: in boolean;
        candy_out, nickel_out, dime_out: out std_logic);
    end component vending_machine;
    
    -- signal declaration
    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '1';
    signal nickel_in_tb, dime_in_tb, quarter_in_tb: boolean;
    signal candy_out_tb, nickel_out_tb, dime_out_tb: std_logic;
 
begin
    
    -- dut instantiation
    dut: vending_machine port map (
    clk_tb, rst_tb, nickel_in_tb, dime_in_tb, quarter_in_tb, candy_out_tb, nickel_out_tb, dime_out_tb
    );

    
    -- stimuli generation
    
    -- clock 
    clk_tb <= not clk_tb after 20 ns;

    -- rst
    rst_tb <= '0' after 40 ns;

    -- nickel_in
    nickel_in_tb <= false, true after 120 ns, false after 160 ns;

    -- dime_in
    dime_in_tb <= false, true after 200 ns, false after 240 ns;

    -- quarter_in
    quarter_in_tb <= false, true after 280 ns, false after 320 ns;


end architecture circuit;


