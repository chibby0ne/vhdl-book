------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity address_decoder is
generic (N: natural := 3;);
    port (address: in natural range 0 to 2**N-1;
         ena: BIT;
         word_line: out bit_vector(2**N-1 downto 0));
end entity;
------------------------------
architecture circuit of address_decoder is
--signals and declarations
begin
    gen: for i in address'range generate
        word_line(i) <= '1' when ena = '0' else
                        '0' when i=address else
                        '1';
    end generate;
end architecture;
------------------------------
