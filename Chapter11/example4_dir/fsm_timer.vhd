--------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity simple_car_alarm is
    port (
        clk, rst, remote, sensors: in std_logic;
        siren: out std_logic);
end entity simple_car_alarm;
--------------------------------------
architecture circuit of simple_car_alarm is
    type state is (disarmed, armed, intrusion);
    signal pr_state, nx_state: state;
    attribute enum_encoding: string;
    attribute enum_encoding of state: type is "sequential";
    signal flag: std_logic;
begin
    
    -- flag generator
    process (clk, rst)
        --declarativepart
    begin
        if (rst = '1') then
            flag <= '0';
        elsif (clk'event and clk = '1') then
            if (remote = '0') then
                flag <= '1';
            else
                flag <= '0';
            end if;
        end if;
    end process;

    --------------------------------------
    -- lower section of FSM
    --------------------------------------
    process (clk, rst)
        --declarativepart
    begin
        if (rst = '1') then
            pr_state <= disarmed;
        elsif (clk'event and clk = '1') then
            pr_state <= nx_state;
        end if;
    end process;
    --------------------------------------

    --------------------------------------
    -- Upper section of FSM
    --------------------------------------
    process (pr_state, remote, sensors, flag)
        --declarativepart
    begin
        case pr_state is
            when disarmed => 
                siren <= '0';
                if (remote = '1' and flag = '1') then
                    nx_state <= armed;
                else
                    nx_state <= disarmed;
                end if;
            when armed => 
                siren <= '0';
                if (sensors = '1') then
                    nx_state <= intrusion;
                elsif (remote = '1' and flag = '1') then
                    nx_state <= disarmed;
                else
                    nx_state <= armed;
                end if;
            when intrusion =>
                siren <= '1';
                if (remote = '1' and flag = '1') then
                    nx_state <= disarmed;
                else
                    nx_state <= intrusion;
                end if;
        end case;
    end process;
end architecture circuit;
--------------------------------------


