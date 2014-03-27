------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- for arch1
-- use ieee.std_logic_arith.all; -- for arch2, arch3
-- best to use arch2 using numeric_std

------------------------------
entity signed_multiplier is
    --generic declarations
    port (
             a: in std_logic_vector(3 downto 0);
             b: in std_logic_vector(3 downto 0);
             prod: out std_vector_vector(7 downto 0);
        );
end entity;
------------------------------
architecture arch1 of signed_multiplier is
    signal a_sig: signed(3 downto 0);
    signal a_sig: signed(3 downto 0);
begin
    a_sig <= signed(a);
    b_sig <= signed(b);
    prod <= std_logic_vector(a_sig * b_sig);
end architecture;
------------------------------
architecture arch2 of signed_multiplier is
    signal a_sig: signed(3 downto 0);
    signal b_sig: signed(3 downto 0);
    signal prod: signed(7 downto 0);
begin
    a_sig <= signed(a);
    b_sig <= signed(b);
    prod_sig <= a_sig * b_sig;
    prod <= std_logic_vector(prod_sig);
end architecture;
------------------------------
architecture arch2 of signed_multiplier is
    signal a_sig: signed(3 downto 0);
    signal b_sig: signed(3 downto 0);
begin
    a_sig <= signed(a);
    b_sig <= signed(b);
    prod <= std_logic_vector(signed(a_sig * b_sig));
end architecture;
------------------------------

