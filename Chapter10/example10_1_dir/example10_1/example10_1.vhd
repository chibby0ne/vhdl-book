--!
--! @file: example10_1.vhd
--! @brief: writing values to a file
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
use std.textio.all;
--------------------------------------
entity write_to_file is
end entity write_to_file;
--------------------------------------
architecture circuit of write_to_file is
    constant period: time := 100 ns;
    signal clk: bit := '0';
    file f: text open write_mode is "test_file.txt";
begin
    proc: process
        constant str1: string(1 to 2) := "t=";
        constant str2: string(1 to 3) := " i=";
        variable l: line;
        variable t: time := 0 ns;
        variable i: natural range 0 to 7 := 0;
    begin
        wait for period/2;
        clk <= '1';
        t := period/2 + i * period;
        write(l, str1);
        write(l, t);
        write(l, str2);
        write(l, i);
        writeline(f, l);
        i := i + 1;
        wait for period/2;
        clk <= '0';
    end process proc;
end architecture circuit;
--------------------------------------

