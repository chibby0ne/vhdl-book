--! 
--! @file: exercise6_7.vhd
--! @brief: Binary Sorter with Loop
--! @author: Antonio Gutierrez
--! @date: 2013-10-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity binary_sorter is
generic (N: integer := 5);
    port (
        input: in bit_vector(N-1 downto 0);
        output: out bit_vector(N-1 downto 0));
end entity binary_sorter;
--------------------------------------
architecture circuit of binary_sorter is
begin
    proc: process (input)
        variable count: integer range 0 to N := 0;
        variable output_buffer: std_logic_vector(N-1 downto 0);
    begin
        
        -- first loop: counts the number of 1's there are in the vector
        forloop: for i in 0 to N-1 loop
            if (input(i) = '1') then
                count = count + 1;
            end if;
        end loop forloop;
        
        -- second loop: assigns 1's at the beginning and then the rest is 0
        forloop1: for i in N-1 downto (N-1)-count loop
            if (count = 0) then
                output(i) <= '0';
            else
                output(i) <= '1';
            end if;
            count = count - 1;
        end loop forloop1;

    end process proc;

end architecture circuit;
--------------------------------------
