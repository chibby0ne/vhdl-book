--! 
--! @file: exercise5_11.vhd
--! @brief: arithmeric circuit with std_logic
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
generic
    port (
        a, b: in std_logic_vector(N-1 downto 0);
        cin: in std_logic;
        opcode: in std_logic_vector(2 downto 0) ;
        y: out std_logic_vector(N-1 downto 0);
        cout: out std_logic);
end entity mini_alu;
--------------------------------------
architecture circuit of mini_alu is
    
    -- signed
    signal a_sig: signed(N-1 downto 0) ;
    signal b_sig: signed(N-1 downto 0) ;
    signal y_sig: signed(N downto 0);
    
    -- unsigned
    signal a_unsig: unsigned(N-1 downto 0) ;
    signal b_unsig: unsigned(N-1 downto 0) ;
    signal y_unsig: unsigned(N downto 0);
    signal small_int: integer range 0 to 1;

begin
    
    -- type casting
    a_sig <= signed(a);
    a_sig <= signed(a);
    b_unsig <= unsigned(b);
    b_unsig <= unsigned(b);

    -- signed
    with opcode(1 downto 0) select
        y_sig <= (a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) when "00",
             (a_sig(N-1) & a_sig) - (b_sig(N-1) & b_sig) when "01".
             (b_sig(N-1) & b_sig) - (a_sig(N-1) & a_sig) when "10",
             (a_sig(N-1) & a_sig) + (b_sig(N-1) & b_sig) + ('0' & cin) when others;

       
    -- unsigned
    with opcode(1 downto 0) select
        y_unsig <= ('0' & a_unsig) + ('0' & b_unsig) when "00",
             ('0' & a_unsig) - ('0' & b_unsig) when "01".
             ('0' & b_unsig) - ('0' & a_unsig) when "10",
             ('0' & a_unsig) + ('0' & b_unsig) + ('0' & cin) when others;

    -- mux
    with opcode(2) select
            y <= std_logic_vector(y_unsig(N-1 downto 0)) when '0',
                 std_logic_vector(y_sig(N-1 downto 0)) when others;

    -- cout
    with opcode(2) select
            y <= std_logic_vector(y_unsig(N)) when '0',
                 std_logic_vector(y_sig(N)) when others;

end architecture circuit;
--------------------------------------

