--! 
--! @file: exercise6_3.vhd
--! @brief:  registered multiplexer
--! @author: Antonio Gutierrez
--! @date: 2013-10-24
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
use work.my_data_types.all;
--------------------------------------
entity reg_mux is
generic (M: integer := 5; -- number of inputs
        N: integer := 8); -- number of bits per input
    port (
        x: in matrix(0 to M-1, N-1 downto 0);
        sel: in std_logic_vector(M-1 downto 0); ;
        y: out std_logic_vector(N-1 downto 0));
end entity reg_mux;
--------------------------------------
architecture circuit of reg_mux is
    signal mux_out: std_logic_vector(N-1 downto 0);
    signal sel_un: unsigned(M-1 downto 0);
begin
    
    -- using sel as an index we need to use an unsigned
    sel_un <= unsigned(sel);

    
    -- assign depending on sel each one of bits in the selected input to the output
    gen: for i in 0 to N-1 generate
        mux_out(i) <= x(sel_un, i);
    end generate gen;

    proc: process (clk)
     begin
         if (clk'event and clk='1') then
             y <= mux_out;
         end if;
     end process label;

    -- maybe this can work as well
--    with sel_un select
--        mux_out <= x(0) when 0,
--        x(sel_un) when others;

end architecture circuit;
--------------------------------------


