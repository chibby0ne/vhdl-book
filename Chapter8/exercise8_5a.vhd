--! 
--! @file: synchronous_counter.vhd
--! @brief: synchronous counter cell
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity sync_counter is
--generic declarations
    port (
        a, b, clk: in std_logic;
        andq, q: out std_logic);
end entity sync_counter;
--------------------------------------
architecture circuit of sync_counter is
    signal temp: std_logic;
begin
    temp <= a and b;
    ff: process (clk)
        variable q_ff: std_logic;
    begin
        if (clk'event and clk = '1') then
            q_ff := q_ff xor temp;
        end if;
    end process ff;
    q <= q_ff;
    andq <= temp;
end architecture circuit;
--------------------------------------

-- Main code
--------------------------------------
entity exercise8_5a is
--generic declarations
    port (
        a, b, clk: in std_logic;
        q: out std_logic_vector(2 downto 0));
end entity exercise8_5a;
--------------------------------------
architecture circuit of exercise8_5a is
--signals and declarations
    component sync_counter is
        port (
        a, b, clk: in std_logic;
        andq, q: out std_logic);
    end component sync_counter;
begin
        sync_cell0: sync_counter port map (
            a => a
            b => b,
            clk => clk,
            q => q(0),
            andq => andq(0),
        );
        sync_cell1: sync_counter port map (
            a => andq(0),
            b => q(0),
            clk => clk,
            q => q(1)
        );
        sync_cell2: sync_counter port map (
            a => andq(1)
            b => q(1),
            clk => clk,
            q => q(2)
        );
end architecture circuit;
