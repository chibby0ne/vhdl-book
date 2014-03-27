------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------
entity test_circuit is
--generic declarations
end entity;
------------------------------
architecture only of test_circuit is
    --DUT declaration--
    component ent is
        port (
                 reset: in std_logic ;
                 clk: in std_logic ;
                 v: in std_logic_vector(3 downto 0) ;
                 x: in std_logic_vector(3 downto 0) ;
                 y: in std_logic_vector(7 downto 0) ;
                 z: in std_logic_vector(7 downto 0) ;
                 out1: out std_logic ;
                 out2: out std_logic ;
                 out3: out std_logic ;
                 out4: out std_logic );
    end component;
    -- signal declaration --
    signal reset_tb: std_logic := '0' ;
    signal clk_tb: std_logic := '0' ;
    signal v_tb: std_logic_vector(3 downto 0) := (others => '0');
    signal x_tb: std_logic_vector(3 downto 0):= (others => '0');
    signal y_tb: std_logic_vector(7 downto 0):= (others => '0');
    signal z_tb: std_logic_vector(7 downto 0):= (others => '0');
    signal out1_tb: std_logic := '0' ;
    signal out2_tb: std_logic := '0';
    signal out3_tb: std_logic := '0';
    signal out4_tb: std_logic := '0';

begin
    -- DUT instantiation
    dut : ent
    port map (
    reset => reset_tb,
    clk => clk_tb,
    v => v_tb,
    x => x_tb,
    y => y_tb,
    z => z_tb,
    out1 => out1_tb,
    out2 => out2_tb,
    out3 => out3_tb,
    out4 => out4_tb
);

-- clock 
    clock : process
    begin
        wait for 10 ns;
        clk_tb <= not clk_tb;
    end process;

-- stimuli generation
--    reset : process
--    begin
--        wait for 4 ns;
 --       reset_tb <= '1';
  --      wait for 4 ns;
   --     reset_tb <= '0';
   -- end process;

    stimuli : process
    begin
        wait for 6 ns;
        v_tb <= "0011";
        wait for 10 ns;
        x_tb <= "1100";
        wait for 10 ns;
        y_tb <= "01000000";
        wait for 10 ns;
        z_tb <= (others => '1');
    end process;
end architecture;

