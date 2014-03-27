-- author: Antonio Gutierrez
-- description: adder and substracter
------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------
entity signed_adder_sub is
generic (N: integer := 4); -- number of input bits
    port (
        a, b: in std_logic_vector(N-1 downto 0);
        cin: in std_logic;
        sum, sub: out std_logic_vector(N downto 0));
end entity;
------------------------------
architecture signed_adder_sub of signed_adder_sub is
    signal a_sig, b_sig: signed(N-1 downto 0);
    signal sum_sig, sub_sig: signed(N downto 0);
begin
    ---------convert to signed---------
    a_sig <= signed(a);
    b_sig <= signed(b);
    ---------add and substract---------
    sum_sig <= (a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) + ('0' & cin);
    sub_sig <= (a_sig(N-1) & a_sig) - (b_sig(N-1) & b_sig) + ('0' & cin);
    ---------output option 1---------
    sum <= std_logic_vector(sum_sig);
    sub <= std_logic_vector(sub_sig);
end architecture;
------------------------------


