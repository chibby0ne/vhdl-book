--! 
--! @file: example8_4.vhd
--! @brief: Shift register with Component and generate
--! @author: Antonio Gutierrez
--! @date: 2013-11-26
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
use work.my_components.all;
--------------------------------------
entity shift_register is
generic (M: positive := 4;   -- num. of stages
         N: positive := 8);  -- bits per stage
    port (
        clk, load: in bit;
        x: in bit_vector(N-1 downto 0);
        d: in twoD(0 to M-1, N-1 downto 0);
        y: out bit_vector(N-1 downto 0));
end entity shift_register;
--------------------------------------
architecture circuit of shift_register is
    signal u: twoD(0 to M, N-1 downto 0);
    signal v: twoD(0 to M-1, N-1 downto 0);
begin
    
    -- transfer of x -> u and u -> y
    gen1: for i in N-1 downto 0 generate
        u(0,i) <= x(i);             -- mapping input of entity to input of first stage
        y(i) <= u(M, i);            -- mapping the output of the last stage to the output of entity
    end generate gen1;
    --  update internal stages
    gen2: for i in 0 to M-1 generate
        gen3: for j in N-1 downto 0 generate

            mux1: mux port map (
                a => u(i, j),
                b => d(i, j),
                sel => load,
                x => v(i, j)
            );

            dff1: flipflop port map (
                d => v(i,j),
                clk => clk,
                q => u(i + 1, j)
            );
        end generate gen3;
    end generate gen2;
end architecture circuit;
