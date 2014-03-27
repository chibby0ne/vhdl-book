--! 
--! @file: exercise5_9.vhd
--! @brief: alu using when
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity alu is
generic
    port (
        a, b: in std_logic_vector(N-1 downto 0);
        cin: in std_logic_vector(N-1 downto 0);
        opcode: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(N-1 downto 0));
end entity alu;
--------------------------------------
architecture circuit of alu is
    signal a_sig, b_sig: signed(N-1 downto 0);
    signal y_unsig: std_logic_vector(N-1 downto 0);
    signal y_sig: signed(N-1 downto 0);
    signal small_int: integer range 0 to 1;
begin
    
    -- logic unit --
    y_unsig <= not a when "000" else
               not b when "001" else
               a and b when "010" else
               a or b when "011" else
               a nand b when "100" else
               a nor b when "101" else
               a xor b when "110" else
               a xnor b;

    
    -- arithmetic unit
    a_sig <= signed(a);
    b_sig <= signed(b);
    small_int <= 1 when cin='1' else 0;

    y_sig <= a_sig when "000" else
             b_sig when "001" else
             a_sig + 1 when "010" else
             b_sig + 1 when "011" else
             a_sig - 1 when "100" else
             b_sig - 1 when "101" else
             a_sig + b_sig when "110" else
             a_sig + b_sig + small_int;


    
    -- mux 
    y <= y_unsig when opcode(3)='0' else std_logic_vector(y_sig);
end architecture circuit;



















































