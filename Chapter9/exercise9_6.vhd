--! 
--! @file: exercise9_6.vhd
--! @brief: function bcd_to_ssd
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package exercise9_6 is
    function bcd_to_ssd(bcd : std_logic_vector) return std_logic_vector
end package exercise9_6;
------------------------------
package body exercise9_6 is

    function bcd_to_ssd(bcd : std_logic_vector) return std_logic_vector is
        variable bcd_uns: unsigned range 0 to (2**std_logic_vector'length)-1
        variable ssd: std_logic_vector(6 downto 0);
    begin
        bcd_uns := unsigned(bcd);

        -- check for bcd code = 4
        assert (bcd'length = 4)
        report "not bcd code in input!"
        severity failure;

        -- bcd to ssd conversion
        case1: case bcd_uns is
            when 0 => ssd := "0000001";
            when 1 => ssd := "1001111";
            when 2 => ssd := "0010010";
            when 3 => ssd := "0000110";
            when 4 => ssd := "1001100";
            when 5 => ssd := "0100100";
            when 6 => ssd := "0100000";
            when 7 => ssd := "0001111";
            when 8 => ssd := "0000000";
            when 9 => ssd := "0000100";
            when others => ssd := "0110000"; -- 'E' on SSD for Error
        end case case1;
        return ssd;
    end function bcd_to_ssd;

end package body exercise9_6;
--------------------------------------
