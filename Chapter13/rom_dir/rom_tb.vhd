--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: rom_tb.vhd
--! @brief: tb for rom
--! @author: Antonio Gutierrez
--! @date: 2014-04-23
--!
--!
--------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------
entity rom_tb is
    generic (PERIOD: time := 40 ns;
            PD: time := 3 ns);
end entity rom_tb;
--------------------------------------------------------
architecture circuit of rom_tb is
    
    -- component declaration
    component rom is
        port (
                 clk: in std_logic;
                 address: in integer range 0 to 15;
                 data_out: out std_logic_vector(7 downto 0));
    end component rom;
    
    -- comp instantiation signal declaration
    signal clk_tb: std_logic := '0';
    signal address_tb: integer range 0 to 15 := 0;
    signal data_out_tb: std_logic_vector(7 downto 0);
    
    -- signal for comparison of output
    type memory is array (0 to 15) of std_logic_vector(7 downto 0);
    constant myrom: memory := (
    2 => "11111111", --255
    3 => "00011010", --26
    4 => "00000101", --5
    5 => "01010000", --80
    6 => "10110000", --176
    15 => "00010001", --17
    others => "00000000");

    
begin

    
    --------------------------------------------------------------------------------------
    -- dut instantiation
    --------------------------------------------------------------------------------------
    dut: rom port map (
        clk =>clk_tb,
        address => address_tb,
        data_out => data_out_tb
    );
    
    
    --------------------------------------------------------------------------------------
    -- stimuli generation
    --------------------------------------------------------------------------------------

    -- clk
    clk_tb <= not clk_tb after PERIOD/2;

    
    -- address
    process
        variable i: integer range 0 to 15 := 0;
    begin
        if (i < 15) then
            wait for PERIOD;
            i := i + 1;
            address_tb <= i;
        end if;
    end process;
    
    
    --------------------------------------------------------------------------------------
    -- output comparison
    --------------------------------------------------------------------------------------
    process
        variable first: integer range 0 to 1 := 0;
        variable i: integer range 0 to 15 := 0;
    begin
        -- add PD to compare output at a time after signal toogling
        if (first = 0) then
            first := 1;
            wait for PD;
        end if;

        -- wait for clk rising edge
        wait for PERIOD/2; 

        assert data_out_tb = myrom(i)
        report "output mismatch!"
        severity failure;

        -- checked all possible outputs 
        if (i = 15) then
            assert false
            report "no errors"
            severity failure;

        end if;

        -- increment address
        i := i + 1;

            -- wait for clock falling edge
        wait for PERIOD/2;

    end process;

end architecture circuit;

