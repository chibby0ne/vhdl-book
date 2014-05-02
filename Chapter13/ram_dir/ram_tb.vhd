--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: ram_tb.vhd
--! @brief: tb of ram
--! @author: Antonio Gutierrez
--! @date: 2014-04-23
--!
--!
--------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------
entity ram_tb is
    generic (M: natural := 4;   -- 2**M = depth
            N: natural := 8;
            PERIOD: time := 40 ns;
            PD: time := 3 ns);   -- N = width
end entity ram_tb;
--------------------------------------------------------
architecture circuit of ram_tb is
    -- dut declaration
    component ram is
        port (
                 clk: in std_logic;
                 we: in std_logic;
                 address: in std_logic_vector(M-1 downto 0);
                 data_in: in std_logic_vector(N-1 downto 0);
                 data_out: out std_logic_vector(N-1 downto 0));
    end component ram;
    
    -- signal declaration
    signal clk_tb: std_logic := '0';
    signal we_tb: std_logic := '0';
    signal address_tb: std_logic_vector(M-1 downto 0) := (others => '0');
    signal data_in_tb: std_logic_vector(N-1 downto 0) := (others => '0');
    signal data_out_tb: std_logic_vector(N-1 downto 0);
    
begin
    
    -- dut instantiation
    dut: ram port map (
        clk => clk_tb,
        we => we_tb,
        address => address_tb,
        data_in => data_in_tb,
        data_out => data_out_tb
    );

    
    -- stimuli generation
    -- clk 
    clk_tb <= not clk_tb after PERIOD / 2;
    
    
    -- addrss
    process
        variable addr: integer range 0 to 2**M - 1 := 0;
    begin
        if (addr < 2**M - 1) then
            wait for PERIOD;
            addr := addr + 1;
            address_tb <= std_logic_vector(to_unsigned(addr, M));
        else
            wait for PERIOD;
            assert false
            report "simulation end"
            severity failure;
        end if;
    end process;

    -- we
    process
    begin
        wait for 2 * PERIOD;     -- addr = 2 --100 ns
        we_tb <= '1';
        wait for 2 * PERIOD;          -- 180 ns
        we_tb <= '0';
        wait;
    end process;

    -- data_in
    process
    begin
        data_in_tb <= std_logic_vector(to_unsigned(4, N));
        wait for 3 * PERIOD;
        data_in_tb <= std_logic_vector(to_unsigned(15, N));
        wait;
    end process;

    -- output comparison 
    process
    begin

        wait for PD;

        -- addr 0
        assert 0 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;

        wait for PERIOD;

        -- addr 1
        assert 0 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;

        wait for PERIOD;

        -- addr 2
        assert 255 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;

        wait for PERIOD / 2;

        -- addr 2
        assert 4 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;

        wait for PERIOD / 2;

        -- addr 3
        assert 26 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;

        wait for PERIOD / 2;

        -- addr 3
        assert 15 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;

        wait for PERIOD / 2;

        -- addr 4
        assert 5 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;

        wait for PERIOD;

        -- addr 5
        assert 80 = to_integer(unsigned(data_out_tb))
        report "output mismatch"
        severity failure;


        wait;
        -- assert false
        -- report "no errors"
        -- severity failure;

    end process;

    

end architecture circuit;    
