--! 
--! @file: exercise5_8.vhd
--! @brief: binary sorter with generate
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity binary_sorter is
generic (N: integer := 5;);
    port (
        input: in std_logic_vector(N-1 downto 0);
        output: out std_logic_vector(N-1 downto 0));
end entity binary_sorter;
--------------------------------------
architecture circuit of binary_sorter is
    type oneDoneD is array (0 to N-1) of integer range 0 to N;
    signal temp: oneDoneD;
begin
    
    -- for the first bit of the count we initialize it depeding on the first bit of input
    temp(0) <= 1 when input(0) = '1' else 0;

    
    -- we do the same thing for all the rest of the input vector
    gen: for i in 1 to N-1 generate
        temp(i) <= temp(i-1) + 1 when input(i) = '1' else temp(i-1);
    end generate gen;

    
    -- for the output we put as many ones as we counted and after that just put zeros
    gen1: for i in N-1 downto 0 generate
        output(i) <= '1' when temp(N-1) > 0 else '0';
        temp(N-1) <= temp(N-1) - 1 when temp(N-1) > 0  else 0;
    end generate gen1;

end architecture circuit;
