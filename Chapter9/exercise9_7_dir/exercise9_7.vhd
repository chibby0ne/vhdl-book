--! 
--! @file: exercise9_7.vhd
--! @brief: Function binary to gray
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity bin_to_gray_conv is
    generic (N: integer := 4);
    port (
        input: in std_logic_vector(N-1 downto 0);
        output: out std_logic_vector(N-1 downto 0));
end entity bin_to_gray_conv;
--------------------------------------
architecture circuit of bin_to_gray_conv is
    function bin_to_gray(binary : std_logic_vector) return std_logic_vector is
        variable result: std_logic_vector(binary'left downto 0);
    begin
        result(result'left) := binary(binary'left);
        for1: for i in result'left-1 to 0 loop
           result(i) := binary(i + 1) xor binary(i); 
        end loop for1;
        return result;
    end function bin_to_gray;
begin
    output <= bin_to_gray(input);
end architecture circuit;
--------------------------------------
