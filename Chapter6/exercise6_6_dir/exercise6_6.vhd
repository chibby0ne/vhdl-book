--! 
--! @file: exercise6_6.vhd
--! @brief: Hamming Weight with LOOP
--! @author: Antonio Gutierrez
--! @date: 2013-10-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity hamming_weight is
generic (N: integer := 5);
    port (
        x: in bit_vector(N-1 downto 0);
        y: out integer range 0 to N);
end entity hamming_weight;
--------------------------------------
architecture circuit of hamming_weight is
signal
begin
    proc: process (x)
        variable count: integer := 0;       -- temp variable that counts the number of 1s
    begin
        forloop: for i in 0 to N-1 loop     -- for each one of the bits in the input vector
            if (x(i) = '1') then            -- if they are 1
                count = count + 1;          -- increment count
            end if;
        end loop forloop;
        y <= count;                         -- once loop through all bits of input vector is finished, assign count to output
    end process proc;
end architecture circuit;
--------------------------------------

