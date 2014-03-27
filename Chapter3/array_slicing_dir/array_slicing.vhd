------------------------------
entity array_slice is
--generic declarations
    port (
        row: in integer range 1 to 3;
        slice: out integer range 0 to 15;);
end entity;
------------------------------
architecture circuit of array_slice is
    type onedoned is array (1 to 3) of integer range 0 to 15;
    constant table: onedoned := (3, 9, 13);
begin
    slice <= table(row);
end architecture;
------------------------------

