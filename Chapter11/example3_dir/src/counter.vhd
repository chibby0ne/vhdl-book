--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: counter.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-05-23
--!
--!
--------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------
entity counter is
--generic declarations
    port (
        clk, rst: in std_logic;
        output: out natural range 0 to 9);
end entity counter;
--------------------------------------------------------
architecture circuit of counter is
    type state is (zero, one, two, three, four, five, six, seven, eight, nine);
    signal pr_state, nx_state: state;
    attribute enum_encoding: string;
    attribute enum_encoding of state: type is "sequential";

begin

    
    --------------------------------------------------------------------------------------
    -- lower section of fsm (sequential)  
    --------------------------------------------------------------------------------------
    process (clk, rst)
        --declarativepart
    begin
        if (rst = '1') then
            pr_state <= zero;
        elsif (clk'event and clk = '1') then
            pr_state <= nx_state;
        end if;
    end process;

    
    --------------------------------------------------------------------------------------
    -- upper section of fsm (combinational)
    --------------------------------------------------------------------------------------
    process (pr_state)
        --declarativepart
    begin
        case pr_state is
            when zero => 
                output <= 0;
                nx_state <= one;

            when one => 
                output <= 1;
                nx_state <= two;

            when two => 
                output <= 2;
                nx_state <= three;

            when three => 
                output <= 3;
                nx_state <= four;

            when four => 
                output <= 4;
                nx_state <= five;

            when five => 
                output <= 5;
                nx_state <= six;

            when six => 
                output <= 6;
                nx_state <= seven;

            when seven => 
                output <= 7;
                nx_state <= eight;

            when eight => 
                output <= 8;
                nx_state <= nine;

            when nine => 
                output <= 9;
                nx_state <= zero;

        end case;

    end process;

end architecture circuit;
--------------------------------------------------------


