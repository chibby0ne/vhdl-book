-- author: Antonio Gutierrez
-- date: 10/10/13
-- description: binary to gray code converter
--------------------------------------
entity bin_gray_converter is
generic (N: integer := 4;);
    port (
        binary: in std_logic_vector(N-1 downto 0);
        gray: out std_logic_vector(N-1 downto 0));
end entity bin_gray_converter;
--------------------------------------
architecture circuit of bin_gray_converter is
begin
    gray <= (binary srl 1) xor binary;
end architecture circuit;
--------------------------------------

