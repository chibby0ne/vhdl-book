--! 
--! @file: exercise5_10.vhd
--! @brief: arithmetic circuit with integer
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity mini_alu is
generic (N: integer := 3;);
    port (
        a, b: in integer range -2**(N-1) to 2**(N-1)-1;
        cin: in integer range 0 to 1; 
        opcode: in integer range 0 to 7;
        y: out integer range -2**(N-1) to 2**(N-1)-1;
end entity mini_alu;
--------------------------------------
architecture circuit of mini_alu is
    signal a_sig, b_sig: signed(N-1 downto 0);
    signal a_unsig, b_unsig: unsigned(N-1 downto 0);
    signal y_sig: signed(N-1 downto 0);
    signal y_unsig: unsigned(N-1 downto 0);
begin
    a_sig <= to_signed(a, a_sig'length);
    b_sig <= to_signed(b, b_sig'length);
    a_unsig <= to_unsigned(a, a_unsig'length);
    b_unsig <= to_unsigned(b, b_unsig'length);
    
    -- signed
    with opcode(1 downto 0) select
        y_sig <= a_sig + b_sig when 0,
             a_sig - b_sig when 1.
             b_sig - a_sig when 2,
             a_sig + b_sig + cin when others;

    -- unsigned
    with opcode(1 downto 0) select
        y_unsig <= a_unsig + b_unsig when 0,
             a_unsig - b_unsig when 1.
             b_unsig - a_unsig when 2,
             a_unsig + b_unsig + cin when others;

    -- mux
    with opcode(2) select
            y <= y_unsig when 0,
                 y_sig when others;

end architecture circuit;
--------------------------------------


