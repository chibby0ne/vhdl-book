--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: example8_4_tb.vhd
--! @brief: testbench of shift register with component and generate
--! @author: Antonio Gutierrez
--! @date: 2014-04-10
--!
--!
--------------------------------------
library ieee;
-- library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_components.all;
--------------------------------------

--------------------------------------
entity shift_register_tb is
    generic (M: positive := 4;   -- num. of stages
         N: positive := 8);  -- bits per stage
end entity shift_register_tb;

--------------------------------------

--------------------------------------
architecture circuit of shift_register_tb is

-- dut declarations
    component shift_register is
    port (
        clk, load: in std_logic;
        x: in std_logic_vector(N-1 downto 0);
        d: in twoD(0 to M-1, N-1 downto 0);
        y: out std_logic_vector(N-1 downto 0));
    end component shift_register;
    
    
    -- signal declaration
    signal clk_tb: std_logic := '0';
    signal load_tb: std_logic := '0';
    signal x_tb: std_logic_vector(N-1 downto 0);
    signal d_tb: twoD(0 to M-1, N-1 downto 0);
    signal y_tb: std_logic_vector(N-1 downto 0);

    constant x_const: integer := 44;
    constant d_tb0: std_logic_vector := std_logic_vector(to_unsigned(55, N));
    constant d_tb1: std_logic_vector := std_logic_vector(to_unsigned(66, N));
    constant d_tb2: std_logic_vector := std_logic_vector(to_unsigned(77, N));
    constant d_tb3: std_logic_vector := std_logic_vector(to_unsigned(88, N));

    type array_of_std_logic_vector is array (natural range <>) of std_logic_vector(N-1 downto 0);
    constant d_tb_all: array_of_std_logic_vector(M-1 downto 0) := ( d_tb3, d_tb2, d_tb1, d_tb0 );
    
begin
    
    -- dut ins
    dut: shift_register port map (
        clk => clk_tb,
        load => load_tb,
        x => x_tb,
        d => d_tb,
        y => y_tb
    );

    
    -- stimuli generation
    -- clk
    clk_tb <= not clk_tb after 20 ns;

    -- x
    x_tb <= std_logic_vector(to_unsigned(44, N)), std_logic_vector(to_unsigned(33,N)) after 170 ns, std_logic_vector(to_unsigned(0, N)) after 210 ns;

    -- load
    load_tb <= '1' after 50 ns, '0' after 61 ns;

    -- uncomment and comment other part
    -- d
    -- initialize each d to each one
    -- gen: for i in N-1 downto 0 generate
    --     d_tb(3, i) <= d_tb3(i);
    --     d_tb(2, i) <= d_tb2(i);
    --     d_tb(1, i) <= d_tb1(i);
    --     d_tb(0, i) <= d_tb0(i);
    -- end generate gen;

    gen1: for j in M-1 downto 0 generate
        gen2: for i in N-1 downto 0 generate
            d_tb(j, i) <= d_tb_all(j)(i);
        end generate gen2;
    end generate gen1;

    
    -- output verification
    process
         --declarative part
    begin

        wait for 61 ns;
        assert y_tb = std_logic_vector(to_unsigned(88, N))
        report "error not expected value at 61 ns"
        severity failure;

        wait for 40 ns;     -- 101
        assert y_tb = std_logic_vector(to_unsigned(77, N))
        report "error not expected value at 101 ns"
        severity failure;

        wait for 40 ns;
        assert y_tb = std_logic_vector(to_unsigned(66, N))
        report "error not expected value at 141 ns"
        severity failure;

        wait for 40 ns;
        assert y_tb = std_logic_vector(to_unsigned(55, N))
        report "error not expected value at 181 ns"
        severity failure;

        wait for 40 ns;
        assert y_tb = std_logic_vector(to_unsigned(44, N))
        report "error not expected value at 221 ns"
        severity failure;

        wait for 80 ns;
        assert y_tb = std_logic_vector(to_unsigned(33, N))
        report "error not expected value at 261 ns"
        severity failure;

        wait for 40 ns;
        assert y_tb = std_logic_vector(to_unsigned(0, N))
        report "error not expected value at 301 ns"
        severity failure;

        assert false
        report "no errors"
        severity note;

    end process;
    


end architecture circuit;

