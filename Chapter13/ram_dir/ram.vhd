-- ram implementation according to the book, usign ram initialization files and only std_logic based ports
-- lessons learned:
-- initialization files of different vendor only work for vendor's fpga
-- reading ram is not registered. ram's output is not registered so whenever address changes output changes as well
-- writing to ram is registered. ram's input is written on the output (and the ram itself) when there's a rising edge and write enable = 1
-- 
--------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------

--------------------------------------------------------
entity ram is
    generic (M: natural := 4;   -- 2**M = depth
            N: natural := 8);   -- N = width
    port (
        clk: in std_logic;
        we: in std_logic;
        address: in std_logic_vector(M-1 downto 0);
        data_in: in std_logic_vector(N-1 downto 0);
        data_out: out std_logic_vector(N-1 downto 0));
end entity ram;
--------------------------------------------------------

--------------------------------------------------------
architecture circuit of ram is
    -- signal declarations
    type memory is array (0 to 2**M-1) of std_logic_vector(N-1 downto 0);
    signal myram: memory := (
    2 => std_logic_vector(to_unsigned(255, N)),
    3 => std_logic_vector(to_unsigned(26, N)),
    4 => std_logic_vector(to_unsigned(5, N)),
    5 => std_logic_vector(to_unsigned(80, N)),
    6 => std_logic_vector(to_unsigned(176, N)),
    15 => std_logic_vector(to_unsigned(17, N)),
    others => std_logic_vector(to_unsigned(0, N)));
    -- attribute ram_init_file: string;
    -- attribute ram_init_file of myram: signal is "ram_contents.mif";
    signal address_int: integer range 0 to 2**M - 1;
    
begin
    --------------------------------------------------------
    -- type casting entity ports
    --------------------------------------------------------
    address_int <= to_integer(unsigned(address));

    --------------------------------------------------------------------------------------
    -- ram operation
    --------------------------------------------------------------------------------------
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (we = '1') then
                myram(address_int) <= data_in;
            end if;
        end if;
    end process;

    data_out <= myram(address_int);

end architecture circuit;

