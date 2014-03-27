--! 
--! @file: exercise5_7.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity hamming_weight_vector is
generic
    port (
        x: in std_logic_vector(N-1 downto 0);
        y: out integer range 0 to N);
end entity hamming_weight_vector;
--------------------------------------
architecture circuit of hamming_weight_vector is
    type oneDoneD is array (0 to N) of integer range 0 to N;
    signal temp: oneDoneD;
begin
    
    -- initialize count of 1's
    temp(0) <= 0;
    
    -- count number of 1's
    gen: for i in 1 to N generate
        temp(i) <= temp(i-1) + 1 when x(i-1) <= '1' else temp(i-1);
    end generate gen;
    
    -- output the number
    y <= temp(N);
end architecture circuit;
--------------------------------------


