library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity testbench is
--generic declarations
end entity testbench;
--------------------------------------
architecture circuit of testbench is
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
begin
    
    -- generation of clk with after (concurrent)
    clk <= not clk after 10 ns;
    
    -- generation of rst with wait for (sequential)
    process
    begin
        wait for 10 ns;
        rst <= '1';
        wait for 10 ns;
        rst <= '0';
        wait;
    end process;
    
    -- generation of rst with after (concurrent)
    -- rst <= '1' after 10 ns, '0' after 20 ns;
end architecture circuit;
