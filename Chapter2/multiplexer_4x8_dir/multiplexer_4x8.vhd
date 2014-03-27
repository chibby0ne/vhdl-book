------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity multiplexer_4x8 is
generic (
    N: natural := 8;  -- bits in in/out signals
    M: natural := 2); -- bits in select
    port (
        mux_inp0: in std_logic_vector(N-1 downto 0);
        mux_inp1: in std_logic_vector(N-1 downto 0);
        mux_inp2: in std_logic_vector(N-1 downto 0);
        mux_inp3: in std_logic_vector(N-1 downto 0);
        selec: in std_logic_vector(M-1 downto 0);
        mux_outp: out std_logic_vector(N-1 downto 0);
        );
end entity;
------------------------------
architecture circuit of multiplexer_4x8 is
--signals and declarations
begin
    mux_outp <= mux_inp0 when selec = "00" else
                mux_inp1 when selec = "01" else
                mux_inp2 when selec = "10" else
                mux_inp3
end architecture;
------------------------------
