--! 
--! @file: my_component.vhd
--! @brief: min_max package
--! @author: Antonio Gutierrez
--! @date: 2013-11-27
--!
--!
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_all;
--------------------------------------
package my_component is
    procedure min_max(a, b, c : in integer; min, max: out integer) 
end package my_component;
------------------------------
package body my_component is
    procedure min_max(signal a, b, c : in integer; signal min, max: out integer) 
    begin
        if (a >= b) then
            if (a >= c) then
                max <= a;
                if (b >= c) then
                    min <= c;
                end if;
            else
                max <= c;
                min <= b;
            end if;
        else
            if (b >= c) then
                max <= b;
                if (a >= c) then
                    min <= c;
                else
                    min <= a;
                end if;
            else
                max <= c;
                min <= a;
            end if;
        end if;
    end procedure min_max;
end package body my_component;
--------------------------------------
