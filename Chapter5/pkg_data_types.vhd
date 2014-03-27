--! 
--! @file: pkg_data_types.vhd
--! @brief: data types for use in generic multiplexer 5.20
--! @author: Antonio Gutierrez
--! @date: 2013-10-23
--!
--!
--------------------------------------
package my_data_types is
    type oneDoneD is array (natural range<>, natural range <>) of bit;
end package my_data_types;
------------------------------
