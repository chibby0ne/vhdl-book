--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: app_ram.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-04-23
--!
--!
--------------------------------------------------------
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg_support.all;
use work.pkg_types.all;
--------------------------------------------------------
entity app_ram is
--generic declarations
    port (
        clk: in std_logic;
        we: in std_logic;
        address: in std_logic_vector(
        data_in: in t_app_ram_out;
        data_out: out t_app_ram_out);
end entity app_ram;
--------------------------------------------------------
architecture circuit of app_ram is

-- signal declarations
    type memory is array (range spec ex natural range <> or 0 to 1) of element type ex std_logic;
begin
    --architecture_statements_part
end architecture circuit;

