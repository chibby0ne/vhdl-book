use std.textio.all;
--------------------------------------
entity read_from_file is
--generic declarations
end entity read_from_file;
--------------------------------------
architecture circuit of read_from_file is
    file f: text open read_mode is "test_file.txt";  -- reado 
    signal clk: bit := '0';
    signal t_out: time range 0 ns to 800 ns;
    signal i_out: natural range 0 to 7;
begin
    proc: process 
        variable l: line;
        variable str1: string(1 to 2);
        variable str2: string(1 to 3);
        variable t: time range 0 ns to 800 ns;
        variable i: natural range 0 to 7;
        -- variable reached: natural range 0 to 1 := 0;
    begin
        wait for 50 ns;
        clk <= '1';
        if (not endfile(f)) then
            readline(f, l);
            read(l, str1);
            read(l, t);
            read(l, str2);
            read(l, i);
            t_out <= t;
            i_out <= i;
        -- else 
        --     reached := 1;
        end if;
        wait for 50 ns;
        clk <= '0';
        -- if (reached = 1) then
        --     wait;
        end if;
    end process proc;
end architecture circuit;

