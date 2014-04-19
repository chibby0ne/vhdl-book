--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: lut_tb.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-04-03
--!
--!
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity lut_tb is
    generic (PERIOD: time := 50 ns);
end entity lut_tb;
--------------------------------------
architecture circuit of lut_tb is

-- dut declaration
   component lut is
       -- generic(const_name const_type = const_value)
       port (
           clk: in std_logic;
           inp: in integer range 0 to 7;
           outp: out std_logic_vector(2 downto 0));
   end component lut;
   
   -- signal declarations
   signal clk_tb: std_logic := '0';
   signal inp_tb: integer range 0 to 7 := 0;
   signal outp_tb: std_logic_vector(2 downto 0);
   constant tp: time := 10 ns;

   type t_lut is array (0 to 7) of std_logic_vector(2 downto 0);
   constant luts_ver: t_lut := (
    "011",  -- 0
    "100",  -- 1
    "110",  -- 2
    "111",  -- 3
    "010",  -- 4
    "001",  -- 5
    "101",  -- 6
    "000"); -- 7

begin
    
    -- dut instantiation
    lut_ins: lut port map (
        clk => clk_tb,
        inp => inp_tb,
        outp => outp_tb
    );
    
    -- clock generation
    clk_tb <= not clk_tb after PERIOD/2;

    
    -- stimuli generation (inp)
    process 
        variable i: natural range 0 to 7 := 0;
    begin
        if (now < 350 ns) then
            wait for PERIOD/2 + tp;
            inp_tb <= i;
            i := i + 1;
            wait for PERIOD/2 - tp;
        else
            wait;
        end if;
    end process;

    -- output verification
    process
        variable outp_ver: std_logic_vector(2 downto 0);
    begin
        if (now < 350 ns) then
            wait for PERIOD/2 + tp;
            outp_ver := luts_ver(inp_tb);
            assert outp_tb = outp_ver
            report "results is not expected at t = " & time'image(now)
            severity failure;
            wait for PERIOD/2 - tp;
        else
            assert false
            report "all good"
            severity note;
            wait;
        end if;
    end process;
end architecture circuit;

