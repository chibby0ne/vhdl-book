--
-- vending machine FSM
--

--------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------
entity vending_machine_noglitch is
--generic declarations
    port (
        clk, rst: in std_logic;
        nickel_in, dime_in, quarter_in: in boolean;
        new_candy_out, new_nickel_out, new_dime_out: out std_logic);
end entity vending_machine_noglitch;
--------------------------------------
architecture circuit of vending_machine_noglitch is
    type state is (st0, st5, st10, st15, st20, st25, st30, st35, st40, st45);
    signal pr_state, nx_state: state;
    attribute enum_encoding: string;
    attribute enum_encoding of state: type is "sequential";
    
    -- output signals of fsm 
    signal candy_out, nickel_out, dime_out: std_logic;
begin
   
    
    --------------------------------------
    -- lower section of FSM (sequential part)
    --------------------------------------

    process (rst, clk)
        --declarativepart
    begin
        if (rst = '1') then
            pr_state <= st0;
        elsif (clk'event and clk = '1') then
            pr_state <= nx_state;
        end if;
    end process;

    --------------------------------------
    

    --------------------------------------
    -- upper section of FSM (combinational part)
    --------------------------------------
    
    process (pr_state, nickel_in, dime_in, quarter_in)
        --declarativepart
    begin
        case pr_state is
            when st0 => 
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';
                if (nickel_in) then
                    nx_state <= st5;
                elsif (dime_in) then
                    nx_state <= st10;
                elsif (quarter_in) then
                    nx_state <= st25;
                else
                    nx_state <= st0;
                end if;
            when st5 => 
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';
                if (nickel_in) then
                    nx_state <= st10;
                elsif (dime_in) then
                    nx_state <= st15;
                elsif (quarter_in) then
                    nx_state <= st30;
                else
                    nx_state <= st5;
                end if;
            when st10 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';
                if (nickel_in) then
                    nx_state <= st15;
                elsif (dime_in) then
                    nx_state <= st20;
                elsif (quarter_in) then
                    nx_state <= st35;
                else
                    nx_state <= st10;
                end if;
            when st15 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';
                if (nickel_in) then
                    nx_state <= st20;
                elsif (dime_in) then
                    nx_state <= st25;
                elsif (quarter_in) then
                    nx_state <= st40;
                else
                    nx_state <= st15;
                end if;
            when st20 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '0';
                if (nickel_in) then
                    nx_state <= st25;
                elsif (dime_in) then
                    nx_state <= st30;
                elsif (quarter_in) then
                    nx_state <= st45;
                else
                    nx_state <= st20;
                end if;
            when st25 =>
                candy_out <= '1';
                nickel_out <= '0';
                dime_out <= '0';
                nx_state <= st0;
            when st30 =>
                candy_out <= '1';
                nickel_out <= '1';
                dime_out <= '0';
                nx_state <= st0;
            when st35 =>
                candy_out <= '1';
                nickel_out <= '0';
                dime_out <= '0';
                nx_state <= st0;
            when st40 =>
                candy_out <= '0';
                nickel_out <= '1';
                dime_out <= '0';
                nx_state <= st35;
            when st45 =>
                candy_out <= '0';
                nickel_out <= '0';
                dime_out <= '1';
                nx_state <= st35;
        end case;
    end process;
    --------------------------------------
        

    --------------------------------------
    -- Output section of FSM (for glitch free operation)
    --------------------------------------
    process (rst, clk)
        --declarativepart
    begin
        if (rst = '1') then
            new_candy_out <= '0';
            new_nickel_out <= '0';
            new_dime_out <= '0';
        elsif (clk'event and clk = '1') then
            new_candy_out <= candy_out;
            new_nickel_out <= nickel_out;
            new_dime_out <= dime_out;
        end if;
    end process;
    --------------------------------------

end architecture circuit;


