--! 
--! @file: exercise8_1.vhd
--! @brief: mux with compenent and generate
--! @author: Antonio Gutierrez
--! @date: 2013-11-26
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity mux4to1 is
    --generic declarations
    port (
    a, b, c, d: in std_logic;
    sel: in std_logic_vector(1 downto 0);
    x: out std_logic);
end entity mux4to1;
--------------------------------------
architecture circuit of mux4to1 is
--signals and declarations
begin
    with sel select
        x <= a when "00",
             b when "01",
             c when "10",
             d when others;
end architecture circuit;
--------------------------------------

--------------------------------------
--------------------------------------
entity exercise8_1 is
    generic (N: integer := 5);
    port (
    a, b, c, d: in std_logic_vector(N-1 downto 0);
    sel: in std_logic_vector(1 downto 0);
    x: out std_logic_vector(N-1 downto 0));
end entity exercise8_1;
--------------------------------------
architecture circuit of exercise8_1 is
    component mux4to1 is
        port (
        a, b, c, d: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        x: out std_logic);
    end component mux4to1;
begin
    gen1: for i in 0 to N-1 generate
        mux1: mux port map (
             a => a(i),
             b => b(i),
             c => c(i),
             d => d(i)
         );
    end generate gen1;
end architecture circuit;
--------------------------------------
