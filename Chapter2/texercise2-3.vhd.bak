------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity test_circuit is
--generic declarations
    end entity;
------------------------------
architecture testbench of test_circuit is
    --DUT declaration--
    component circuit is
        port ( a: in std_logic;
               b: in std_logic;
               c: in std_logic;
               clk: in std_logic;
               reg_z: out std_logic);
    end component;
    -- signal declaration --	
    signal a_tb: std_logic := '1';
    signal b_tb: std_logic := '0';
    signal c_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal x_tb: std_logic;
    signal y_tb: std_logic;
    signal z_tb: std_logic;
    signal reg_z_tb: std_logic;

begin
    -- DUT instantiation --
    dut: circuit
    PORT MAP (
                 a => a_tb,
                 b => b_tb,
                 c => c_tb,
                 clk => clk_tb,
                 reg_z => reg_z_tb);
    -- internal signals connection --
    x_tb <= a_tb nand b_tb;
    y_tb <= c_tb or x_tb;
    z_tb <= a_tb xor y_tb;

    -- clock --
    clock : process 
    begin
        wait for 10 ns;
        clk_tb <= not clk_tb;
    end process;

    -- stimuli generation --
    stimuli : process
    begin
        wait for 20 ns;
        b_tb <= '1';
        wait for 20 ns;
        c_tb <= '1';
        wait for 20 ns;
        b_tb <= '0';
        wait for 20 ns;
        c_tb <= '0';
        wait for 20 ns;
        a_tb <= '0';
        wait for 20 ns;
        b_tb <= '1';
        wait;
    end process;

end architecture;
------------------------------
