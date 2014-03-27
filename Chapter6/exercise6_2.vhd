-- author: Antonio Gutierrez
-- date: 09/10/13
-- description: gray counter
--------------------------------------
entity gray_counter is
generic (maxnumbits: integer := 4;);
    port (
        clk: in std_logic;
        count: out std_logic_vector(maxnumbits-1 downto 0);
end entity gray_counter;
--------------------------------------
architecture circuit of gray_counter is
begin
    proc: process (clk)
        variable binary: std_logic_vector(maxnumbits-1 downto 0) := (others => '0');
        variable temp: std_logic_vector(maxnumbits-1 downto 0) := (others => '0');
    begin
        if (clk'event and clk = '1') then 
            if (binary = (others => '0')) then          ---- if count starts then don't increment so as to have first elelemnt in count all zeros
                binary := binary;
            elsif (binary = 2**(maxnumofbits-1) - 1) then ---- if max reached then reset count to zero
                binary := (others => '0');
            else                                        ---- if not 0 and not max then increment count
                binary := binary + 1;
            end if;
        end if;
        if (binary = '0') then
            count <=  (others => '0');
        else
            count <= (binary srl 1) xor binary;             ---- according to wikipedia (converting binary to gray code)
            end if;
    end process proc;
end architecture circuit;
--------------------------------------

