-- author: Antonio Gutierrez
-- date: 03/10/13
-- description: shift register
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity shift_register is
generic (N: integer := 4;); ---- number of stages
    port (
        din, clk, rst: in std_logic;
        dout: out std_logic);
end entity shift_register;
--------------------------------------
architecture shift_register of shift_register is
--signals and declarations
begin
    main: process (clk, rst)
        variable q: std_logic_vector(0 to N-1);
    begin
        if (rst = '1') then
            q := (others => '0');
        elsif (clk'event and clk = '1') then
            q := din & q(0 to N-2); ---- concatenate din to three least significant bits of q 
        end if;
        dout <= q(N-1);  -- dout is the msb of q
    end process main;
end architecture shift_register;
