--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: rom.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-04-23
--!
--!
--------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity rom is
    port (
        clk: in std_logic;
        address: in integer range 0 to 15;
        data_out: out std_logic_vector(7 downto 0));
end entity rom;
--------------------------------------------------------
architecture circuit of rom is
    signal reg_address: integer range 0 to 15;
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
    
    --------------------------------------------------------
    -- register the address
    --------------------------------------------------------
    process (clk)
    begin
        if (clk'event and clk = '1') then
            reg_address <= address;
        end if;
    end process;

    --------------------------------------------------------
    -- get unregistered output
    --------------------------------------------------------
    data_out <= myrom(reg_address);

end architecture circuit;

