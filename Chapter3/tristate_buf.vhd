------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------
entity tri_state is
--generic declarations
    port (
        input: in std_logic;
        enable: in std_logic;
        output: out std_logic;);
end entity;
------------------------------
architecture circuit of tri_state is
--signals and declarations
begin
    output <= input when enable = '1' else 'z';
end architecture;
------------------------------
