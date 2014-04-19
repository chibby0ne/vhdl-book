library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity addr_deco is
generic (N: integer := 3);
    port (
        address: in natural range 0 to 2**N-1;
        ena: in bit;
        word_line: out bit_vector(2**N-1 downto 0));
end entity addr_deco;
--------------------------------------
architecture circuit of addr_deco is
--signals and declarations
begin
    gen: for i in word_line'range generate
        word_line(i) <= '1' when ena = '0' else
                        '0' when i = address else
                        '1';
    end generate gen;
end architecture circuit;
--------------------------------------



