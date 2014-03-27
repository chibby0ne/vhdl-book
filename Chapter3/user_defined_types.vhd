-- integer types --
-- type type_nam is range range_specifications;
type negative is range integer'low to -1;
type temperature is range 0 to 273;
type my_integer is range -32 to 32;

-- enumerated type --
-- type type_name is (type_values_list);
type bit is ('0', '1');
type boolean is (FALSE, TRUE);
type std_ulogic is ('U', 'X', '0', '1', 'Z', 'W', 'L', 'H', '-');

-- array types (integer array types) --
-- type type_name is array (range_specs) of element_types
-- type type_name is array (range_specs) of element_types
type  bit_vector is array (natural range <>) of bit;
type  boolean_vector is array (natural range <>) of boolean;
type  integer_vector is array (natural range <>) of integer;
type std_ulogic_vector is array (natural range <>) of std_logic;

-- 1D x 1D 
type type1 is array (positive range <>) of integer;
constant const1: type1(1 to 4) := (5, -5, 3, 0);

type type2 is array (0 to 3) of natural;
constant const2: type2 := (2, 0, 9, 4);

------------------------------
-- 1D x 1D x 1D
type type3 is array (1 to 2) of type2;
const const3: type3 := ((5, 5, 7, 99), (33, 4, 0, 0));

-- enumerated type
-- type type_name is array (range specs) of enum_elements_type;
-- 1D arrays
------------------------------
type type1 is array (natural range <>) of std_logic;
constant const1: type1(4 downto 1) := "Z111";
------------------------------
type type2 is array (7 downto 0) of bit;
constant const2: type2 := "00001111";
------------------------------

-- 1D x 1D array
type tpe


