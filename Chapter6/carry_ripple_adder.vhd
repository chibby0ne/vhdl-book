-- author: Antonio Gutierrez
-- date: 08/10/13
-- description: carry ripple adder (with loop)
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------
entity carry_ripple_adder is
generic
    port (
        a, b: in std_logic_vector(N-1 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(N-1 downto 0); cout: out std_logic);
end entity carry_ripple_adder;
--------------------------------------
architecture circuit of carry_ripple_adder is
--signals and declarations
begin
    proc: process (a, b, cin)
        variable c: std_logic_vector(N downto 0);
    begin
        c(0) := cin;    -- assign cin to LSB in c
        sum: for i in 0 to N-1 loop     ----for every bit in input operands
            s(i) <= a(i) xor b(i) xor c(i);     -- calculate sum  for current bit
            c(i +1) := (a(i) and b(i)) or (a(i) and c(i)) or (b(i) and c(i)); -- calculate carry for next bit
        end loop sum;
        cout <= c(N);
    end process proc;
end architecture circuit;
--------------------------------------

