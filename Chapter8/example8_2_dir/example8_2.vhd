--! 
--! @file: example8_2.vhd
--! @brief: circular shift register with component
--! @author: Antonio Gutierrez
--! @date: 2013-11-21
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------


-- mux --
entity mux is
--generic declarations
    port (
        a, b, sel: in bit;
        x: out bit);
end entity mux;
--------------------------------------
architecture circuit of mux is
--signals and declarations
begin
    x <= a when sel = '0' else b;
end architecture circuit;
--------------------------------------



-- flip flop --
entity flipflop is
--generic declarations
    port (
        d, clk: in bit;
        q: out bit);
end entity flipflop;
--------------------------------------
architecture circuit of flipflop is
--signals and declarations
begin
    proc: process (clk)
        --declarativepart
    begin
        if (clk'event and clk = '1') then
            q <= d;
        end if;
    end process proc;
end architecture circuit;
--------------------------------------


-- main code --
entity circular_shift is
--generic declarations
    port (
        clk, load: in bit;
        d: in bit_vector(0 to 3);
        q: buffer bit_vector(0 to 3));
end entity circular_shift;
--------------------------------------
architecture circuit of circular_shift is
    signal i: bit_vector(0 to 3);
    --------------------------------------
    -- component mux declaration --
    component mux is
        port (
        a, b, sel: in bit;
        x: out bit);
    end component mux;
    --------------------------------------
    -- component flipflop declaration --
    component flipflop is
        port (
        d, clk: in bit;
        q: out bit);
    end component flipflop;
--------------------------------------
begin
    -- component mux instantiation
    mux1: mux
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        a => q(3),
        b => d(0).
        sel => load,
        x => i(0)
    );
 -- component mux instantiation
    mux2: mux
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        a => q(2),
        b => d(1).
        sel => load,
        x => i(1)
    );
 -- component mux instantiation
    mux2: mux
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        a => q(1),
        b => d(2).
        sel => load,
        x => i(2)
    );
 -- component mux instantiation
    mux3: mux
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        a => q(0),
        b => d(3).
        sel => load,
        x => i(3)
    );
    -- component flipflop instantiation
    dff1: flipflop
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        d => i(0),
        clk => clk,
        q => q(0)
    );
    -- component flipflop instantiation
    dff2: flipflop
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        d => i(1),
        clk => clk,
        q => q(1)
    );

    -- component flipflop instantiation
    dff2: flipflop
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        d => i(2),
        clk => clk,
        q => q(2)
    );

    -- component flipflop instantiation
    dff3: flipflop
    -- -- generic map (MAX => 10) used for overwriting generic constants
    port map (
        d => i(3),
        clk => clk,
        q => q(3)
    );
end architecture circuit;

