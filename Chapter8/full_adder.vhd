--! 
--! @file: full_adder.vhd
--! @brief: full adder
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
entity full_adder is
    port (
        a, b: std_logic;
        cin: in std_logic;
        s: out std_logic;
        cout: out std_logic);
end entity adder;
--------------------------------------
architecture circuit of full_adder is
--signals and declarations
begin
    s <= a xor b xor cin;
    cout <= (a and b) or (b and cin) or (cin and a);
    end process proc1;
end architecture circuit;
--------------------------------------
