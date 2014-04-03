--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: writing_to_file.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-04-01
--!
--!
--------------------------------------
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg_support.all;
use work.pkg_types.all;
--------------------------------------
entity writing_to_file is
--generic declarations
end entity writing_to_file;
--------------------------------------
architecture circuit of writing_to_file is
    file f: text open write_mode is "text.txt";
    signal inp: natural range 0 to 7 := 1;
    signal outp: std_logic_vector(2 downto 0) := '100';
begin

    proc: process 
        variable inp: natural range 0 to 7 := '1';
        variable outp: std_logic_vector(2 downto 0) := "100";
        variable l: line;
        variable t: time range 0 to 400 ns;
        variable i: natural range 0 to 8 := '0';
        variable str1: string(1 to 2) := "t=";
        variable str2: string(1 to 5) := " inp=";
        variable str3: string(1 to 6) := " outp=";
        variable space: character := ' ';
        variable str_time: string(1 to 4) := "time";
        variable str_inp: string(1 to 3) := "inp";
        variable str_outp: string(1 to 4) := "outp";
        variable str_ns: string(1 to 2) := "ns";
    begin
        if (now < 400 ns) then
            wait for period/2;
            t := period/2 + i*period;
            case i is
                when 0 => inp := '1', outp := "100";
                when 1 => inp := '2', outp := "110";
                when 2 => inp := '0', outp := "011";
                when 3 => inp := '3', outp := "111";
                when 4 => inp := '4', outp := "010";
                when 5 => inp := '6', outp := "101";
                when 6 => inp := '7', outp := "000";
                when 7 => inp := '5', outp := "001";
            end case;
            if (i = 0) then
                write(l, str_time); write(l, space); write(l, str_inp); write(l, space); write(l, str_outp);
            else 
                write(l, t); write(l, str_ns); write(l, space); write(l, inp); write(l, space); write(l, outp);
            end if;
            -- write(l, str1); write(l, t); write(l, str2); write(l, inp); write(l, str3); write(l, outp);
            i = i + 1;
        else 
            wait;
        end if;
    end process proc;


end architecture circuit;

