------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------
entity ent is
--generic declarations
    port (
        reset: in std_logic ;
        clk: in std_logic ;
        v: in std_logic_vector(3 downto 0) ;
        x: in std_logic_vector(3 downto 0) ;
        y: in std_logic_vector(7 downto 0) ; 
        z: in std_logic_vector(7 downto 0) ;
        out1: out std_logic ;
        out2: out std_logic ;
        out3: out std_logic ;
        out4: out std_logic );
end entity;
------------------------------
architecture circuit of ent is
    signal v_sig: signed(3 downto 0) := signed(v);
    signal x_sig: signed(3 downto 0):= signed(x);
    signal y_sig: signed(7 downto 0)  := signed(y);
    signal z_sig: signed(7 downto 0) := signed(z);
    signal a: integer range 0 to 7;
    signal b: signed(3 downto 0);
    signal c: signed(3 downto 0);
    signal d: signed(3 downto 0);

begin
    process (clk)
    begin 
        if (clk'event and clk = '1') then
            if (v_sig > x_sig) then
                out1 <= '1';
            elsif ( v_sig + x_sig <= z_sig) then
                out2 <= '1';
            end if;
        end if;
--    out1 <= '1' when v_sig > x_sig else '0';
--    out2 <= '1' when v_sig + x_sig <= z_sig else '0';
--    out3 <= '1' when y_sig = ((abs(x_sig))**3) else '0';
   -- out3 <= '1' when (7 * v_sig) rem x = (7 *v_sig) mod x else '0';
    end process;
end architecture;
------------------------------
