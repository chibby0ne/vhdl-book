--! 
--! @file: exercise5_20.vhd
--! @brief: Generic Multiplexer
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
use work.my_data_types.all;
--------------------------------------
entity gen_mux is
generic (N: integer := 5;
         M: integer := 4);
    port (
        x: in oneDoneD (0 to M-1, N-1 downto 0);
        sel: in integer range 0 to M-1 ;
        y: out bit_vector(N-1 downto 0));
end entity gen_mux;
--------------------------------------
architecture circuit of gen_mux is
--signals and declarations
begin
    gen: for i in N-1 downto 0 generate
        y(i) <= x(sel, i);
    end generate gen;

    -- maybe this one as well
--    with sel select
--        y <= x(0) when 0,
--        x(sel) when others;
end architecture circuit;
--------------------------------------
entity gen_mux1 is
generic (N: integer := 5;
         M: integer := 4);
    port (
        x: in bit_vector(M*N-1 downto 0);
        sel: in integer range 0 to M-1;
        y: out bit_vector(N-1 downto 0));
end entity gen_mux1;
--------------------------------------
architecture circuit2 of gen_mux1 is
--signals and declarations
begin
    gen1: for i in N-1 downto 0 generate
        y(i) <= x(sel*N + i);
    end generate gen1;
end architecture circuit2;
--------------------------------------

