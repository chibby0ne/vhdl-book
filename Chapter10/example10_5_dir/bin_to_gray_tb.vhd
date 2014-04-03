library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
--------------------------------------
entity bin_to_gray_tb is
generic (period: TIME := 100 ns);
end entity bin_to_gray_tb;
--------------------------------------
architecture circuit of bin_to_gray_tb is
 
 -- DUT declaration
    component bin_to_gray is
    port (
        bin: in std_logic_vector(N-1 downto 0);
        gray: out std_logic_vector(N-1 downto 0));
    end component bin_to_gray;
    
    -- signals declarations
    signal b: std_logic_vector(2 downto 0);
    signal g, gtest: std_logic_vector(2 downto 0);
    file f: text open read_mode is "template.txt";

begin
    
    -- DUT instantiation
    dut: bin_to_gray port map (
        bin => b,
        grey => g
    );
    
    -- output verification
    proc: process 
        variable good_value: boolean;
        variable space: character;
        variable bfile, gfile: bit_vector(2 downto 0);
    begin
        
        -- read file line by line until end 
        wh: while not endfile(f) loop
            readline(f, l);
            
            
            -- read bin value
            read(l, bfile, good_value);

            -- check if type of value outputed is the same as in template
            assert good_value
            report "Improper value for 'bin' in file!"
            severity failure;
            
            -- convert same type as entity
            b <= to_stdlogicvector(bfile);

            
            -- get space from between and skip it
            read(l, space);

            
            -- read grey value expected
            read(l, gfile, goodvalue);

            -- check if type of value outputed is the same as in template
            assert good_value
            report "Improper value for 'gray' in file!"
            severity failure;
            
            -- convert grey value expected to same type as entity for correct comparison
            gtest <= to_stdlogicvector(gfile);

            
            -- compare and verify output from design vs. output expected 
            assert(gtest = g)
            report "Data mismatch!"
            severity failure;
            wait for period;
        end loop wh;
        
        -- once the end of file is reach then have satisfied the testbench so no errors where found
        assert false
        report "No errors found!"
        severity note;
        wait;
    end process proc;
end architecture circuit;
--------------------------------------
