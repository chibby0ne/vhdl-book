-- author: Antonio Gutierrez
-- date: 08/10/13
-- description: design tha t counts the number of leading zeros
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity leading_zeros is
--generic declarations
    port (
        data: in std_logic_vector(7 downto 0);
        zeros: out integer range 0 to 8);
end entity leading_zeros;
--------------------------------------
architecture circuit of leading_zeros is
--signals and declarations
begin
    proc: process (data)
        variable count: integer range 0 to 8;
    begin
        count := 0;
        loop1: for i in data'range loop
            case data(i) is
                when '0' => count := count + 1;
                when others => exit;
            end case;
        end loop loop1;
        zeros <= count;
    end process proc;
end architecture circuit;

