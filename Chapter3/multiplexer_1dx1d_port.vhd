use work.my_data_types.all;
------------------------------
entity mux is
--generic declarations
    port (
        x: in oneDoneD ;
        sel: in integer range 0 to 3;
        y: out bit_vector(7 downto 0) ;);
end entity;
------------------------------
architecture circuit of mux is
--signals and declarations
begin
    y <= x(sel);
end architecture;
------------------------------

