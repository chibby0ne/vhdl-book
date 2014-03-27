--! 
--! @file: exercise8_2.vhd
--! @brief: circuilar shift with compenet #1 constant width
--! @author: Antonio Gutierrez
--! @date: 2013-11-26
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;

library work;
use work.my_components.all;

-- Main code
--------------------------------------
entity exercise8_2 is
    generic (M: integer := 5);   -- num of stages
    port (
        clk, load: in std_logic;
        d: in twoD(0 to M-1, N-1 downto 0);
        q: buffer twoD(0 to M-1, N-1 downto 0));
    constant N: integer := 8;   -- bits per stage
end entity exercise8_2;
--------------------------------------
architecture circuit of exercise8_2 is
    signal u: twoD(0 to M-1, N-1 downto 0); -- output of muxes
    signal v: twoD(0 to M-1, N-1 downto 0); -- output of ffs
begin
    gen1: for i in N-1 downto 0 generate        -- width
        gen2: for j in 0 to M-1 generate        -- length
            mux1: mux port map (
                a => d(i, j),
                b => v(i, M-1( - j)),
                sel => load,
                q => u(i, j)                
            );
            dff1: flipflop port map (
                d => u(i, j),
                clk => clk,
                q => v(i, j)
            );

        end generate gen2;
    end generate gen1;
end architecture circuit;
--------------------------------------
