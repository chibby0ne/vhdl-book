--! 
--! @file: exercise5_3.vhd
--! @brief: design a generic AND and NAND gate using concurrent code
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity and__nand_gate is
generic (N: integer := 5;);
    port (
        x: in std_logic_vector(N-1 downto 0) ;
        y: out std_logic);
end entity and_gate;
--------------------------------------
architecture and_circuit of and_gate is
begin
    with x select
        y <= '1' when (others => '1'),
        '0' when others;
end architecture and_circuit;
--------------------------------------
architecture nand_circuit of and_gate is
--signals and declarations
begin
    with x select
        y <= '0' when (others => '1'),
        '1' when others;
end architecture nand_circuit;
--------------------------------------


