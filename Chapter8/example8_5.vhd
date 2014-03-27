--! 
--! @file: example8_5.vhd
--! @brief: adder with compoenet and generate
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
library work;
use work.pkg_adder.all;
--------------------------------------
entity adder is
generic (N: integer := 8);
    port (
        a, b: in std_logic_vector(N-1 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(N-1 downto 0);
        cout: out std_logic);
end entity adder;
--------------------------------------
architecture circuit of adder is
    signal cin_cout: std_logic_vector(N-1 downto 0);
begin
    
    -- first adder has cin as cin of entity
    add0: full_adder port map (
            a => a(0),
            b => b(0),
            cin => cin,
            s => s(0)
            cout => cin_cout(0)
        );

    
    -- middle adder have cin as cout of previous and cout as next cin
    gen1: for i in 1 to N-1 generate
        add1: full_adder port map (
            a => a(i),
            b => b(i),
            cin => cin_cout(i-1),
            s => s(i)
            cout => cout_cout(i)
        );
    end generate gen1;

    
    -- last adder's cout is cout of entity
    cout <= cout_cout(N-1);

end architecture circuit;

