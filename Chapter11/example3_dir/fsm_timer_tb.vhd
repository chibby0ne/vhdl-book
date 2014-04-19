library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity fsm_timer_tb is
end entity fsm_timer_tb;
--------------------------------------
architecture circuit of fsm_timer_tb is

-- dut declaration
    component simple_car_alarm is
    port (
        clk, rst, remote, sensors: in std_logic;
        siren: out std_logic);
    end component simple_car_alarm;

    
    -- signal declaration
        signal clk_tb: std_logic := '0';
        signal rst_tb, remote_tb, sensors_tb: std_logic;
        signal siren_tb: std_logic;

begin
    
    -- dut instantiation
    dut: simple_car_alarm port map (
        clk => clk_tb,
        rst => rst_tb,
        remote => remote_tb,
        sensors => sensors_tb,
        siren => siren_tb
    );

    
    -- stimuli generation
    
    -- clk
    clk_tb <= not clk_tb after 20 ns;

    -- rst 
    rst_tb <= '1', '0' after 40 ns;

    -- remote
    remote_tb <= '0', '1' after 160 ns, '0' after 200 ns, '1' after 240 ns, '0' after 320 ns, '1' after 400 ns, '0' after 480 ns, '1' after 680 ns, '0' after 800 ns;

    -- sensors
    sensors_tb <= '0', '1' after 560 ns, '0' after 640 ns;


    
    -- output comparison check
--
--     process 
--         --declarativepart
--     begin
--
--         -- 0 ns = disarmed
--         assert pr_state = disarmed
--         report "error initial state not disarmed"
--         severity failure;
--
--
--         -- 180 ns = armed
--
--         wait for 180 ns;
--         assert pr_state = armed
--         report "error state not armed"
--         severity failure;
--
--
--         -- 260 ns = disarmed
--         wait for 80 ns;   
--
--         assert pr_state = disarmed
--         report "error state not disarmed"
--         severity failure;
--
--
--         -- 420 ns = armed
--         wait for 160 ns;   
--
--         assert pr_state = armed
--         report "error state not armed"
--         severity failure;
--
--         -- 580 ns = intrusion
--         wait for 160 ns;   
--
--         assert pr_state = intrusion
--         report "error state not intrusion"
--         severity failure;
--
--         -- 700 ns = intrusion
--         wait for 120 ns;   
--
--         assert pr_state = disarmed
--         report "error state not intrusion"
--         severity failure;
--
--
--         -- testbench passed
--         assert false
--         report "testbench passed"
--         severity note;
--
--         -- wait forever
--         wait;
--
--     end process;
end architecture circuit;
