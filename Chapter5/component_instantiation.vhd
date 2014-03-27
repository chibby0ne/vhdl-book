------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------
entity mux2x1 is
--generic declarations
    port (
        a, b, sel: in std_logic;
        x: out std_logic);
end entity;
------------------------------
architecture mux2x1 of mux2x1 is
--signals and declarations
begin
    x <= a when sel = '0' else b;
end architecture;
------------------------------

library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity mux2x3 is
--generic declarations
    port (
        a, b: in std_logic(3 downto 0);
        sel: in std_logic;
        x: out std_logic(3 downto 0));
end entity;
------------------------------
architecture mux2x3 of mux2x3 is
    --signals and declarations
    --component declaration
    component mux2x1 is
        port (
            a, b, sel: in std_logic;
            x: out std_logic);
    end component;
begin
    --component instantiation
    generate_mux2x3: for i in 0 to 2 generate
         -- declarative part
        comp: mux2x1 port map (a(i), b(i), sel, x(i));
    end generate;
end architecture;
------------------------------

