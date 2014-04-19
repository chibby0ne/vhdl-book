--type IV testbench for an address decoder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--------------------------------------
entity addr_deco_tb is
    generic (N: integer := 3);
end entity addr_deco_tb;
--------------------------------------
architecture circuit of addr_deco_tb is
    

    -- dut declaration
    component addr_deco is
        generic (N: integer := 3);
    port (
        address: in natural range 0 to 2**N-1;
        ena: in bit;
        word_line: out bit_vector(2**N-1 downto 0));
    end component addr_deco;

    -- signals declarations

    signal address_tb: natural range 0 to 2**N-1 := 0;
    signal ena_tb: bit := '1';
    signal word_line_tb: bit_vector(2**N-1 downto 0);
    signal expected: bit_vector(2**N-1 downto 0);


begin
    
    -- dut instantiation
    dut: addr_deco port map (
        address => address_tb,
        ena => ena_tb,
        word_line => word_line_tb
    );

    
    -- stimuli generation
    -- ena
    process 
    begin
        wait for 20 ns;
        ena_tb <= '0';
        wait for 20 ns;
        ena_tb <= '1';
        wait;
    end process;

    -- stimuli generation
    -- address
    process 
    begin
        wait for 60 ns;
        address_tb <= 1;
        wait for 20 ns;
        address_tb <= 2;
        wait for 20 ns;
        address_tb <= 3;
        wait for 20 ns;
        address_tb <= 4;
        wait for 20 ns;
        address_tb <= 5;
        wait for 20 ns;
        address_tb <= 6;
        wait for 20 ns;
        address_tb <= 7;
        wait;
    end process;

    
    -- output verification
    -- generate template
    expected <= "11111110",
                "11111111" after 21 ns,
                "11111110" after 41 ns,
                "11111101" after 61 ns,
                "11111011" after 81 ns,
                "11110111" after 101 ns,
                "11101111" after 121 ns,
                "11011111" after 141 ns,
                "10111111" after 161 ns,
                "01111111" after 181 ns;

    
    -- make comparison
    process 
    begin
        wait for 1 ns;
        if (ena_tb = '0') then
            assert word_line_tb = "11111111"
            report "error. enable is not reseting output"
            severity failure;
        else
            if (now > 180 ns) then
                assert false
                report "no errors"
                severity note;
                wait;
            else
                assert word_line_tb = expected
                report "error. for address_tb = " & natural'image(address_tb) 
                severity failure;
            end if;
        end if;
    end process;
end architecture circuit;



