--! 
--! @file: flipflop.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2013-11-26
--!
--!
--------------------------------------
entity flipflop is
--generic declarations
    port (
        d, clk: in std_logic;
        q: out std_logic);
end entity flipflop;
--------------------------------------
architecture circuit of flipflop is
--signals and declarations
begin
    proc: process (clk)
        --declarativepart
    begin
        if (clk'event and clk = '1') then
            q <= d;
        end if;
    end process proc;
end architecture circuit;
--------------------------------------

