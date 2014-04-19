--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: lut.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-04-03
--!
--!
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------
entity lut is
--generic declarations
    port (
        clk: in std_logic;
        inp: in integer range 0 to 7;
        outp: out std_logic_vector(2 downto 0));
end entity lut;
--------------------------------------
architecture circuit of lut is
    type t_lut is array (0 to 7) of std_logic_vector(2 downto 0);
    constant luts: t_lut := (
    "011",  -- 0
    "100",  -- 1
    "110",  -- 2
    "111",  -- 3
    "010",  -- 4
    "001",  -- 5
    "101",  -- 6
    "000"); -- 7
begin
    process (clk)
        --declarativepart
    begin
        if (clk'event and clk = '1') then
            outp <= luts(inp);
        end if;
    end process;
end architecture circuit;
