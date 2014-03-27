------------------------------
entity array_slices is
--generic declarations
    port (
        row: in integer range 0 to 3;
        column: in integer range 0 to 4;
        slice1: out bit ;
        slice2: out bit_vector(1 to 2) ;
        slice3: out bit_vector(1 to 4) ;
        slice4: out bit_vector(1 to 3) ;);
end entity;
------------------------------
architecture circuit of array_slices is
    type twod is array (1 to 3, 1 to 4) of bit;
    constant table: twod := (('0', '0', '0', '1'),
                             ('1', '0', '0', '1'),
                             ('1', '1', '0', '1'));
begin
    slice1 <= table(row)(column);
   -- slice2 <= table(row, 1 to 2);
   -- slice3 <= table(row, 1 to 4);
   -- slice4 <= table(1, column) & table(2, column) & table(3, column);
   gen: for i in 1 to 3 generate
       slice4(i) <= table(i, column);
   end generate;
end architecture;
------------------------------

