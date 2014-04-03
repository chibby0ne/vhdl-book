--! 
--! Copyright (C) 2010 - 2013 Creonic GmbH
--!
--! @file: lut_tb.vhd
--! @brief: 
--! @author: Antonio Gutierrez
--! @date: 2014-04-03
--!
--!
--------------------------------------
entity lut_tb is
    generic (PERIOD: time := 50);
end entity lut_tb;
--------------------------------------
architecture circuit of lut_tb is

-- dut declaration
   component lut is
       -- generic(const_name const_type = const_value)
       port (
           clk: in std_logic;
           inp: in integer range 0 to 7;
           outp: out std_logic_vector(2 downto 0));
   end component lut;
   
   -- signal declarations
   signal clk_tb: std_logic := '0';
   signal inp_tb: integer range 0 to 7 := '0';
   signal outp_tb: std_logic_vector(2 downto 0);

   type t_lut is array (0 to 7) of std_logic_vector(2 downto 0);
   constant luts_ver: t_lut := (
    "011",  -- 0
    "100",  -- 1
    "110",  -- 2
    "111",  -- 3
    "010",  -- 4
    "001",  -- 5
    "101",  -- 6
    "000"); -- 7

begin
    
    -- dut instantiation
    lut_ins: lut port map (
        clk => clk_tb,
        inp => inp_tb,
        outp => outp_tb
    );
    
    -- clock generation
    clk_tb <= not clk_tb after PERIOD/2;

    
    -- stimuli generation (inp)
    process (clk_tb)
        variable i: natural range 0 to 8 := 1;
    begin
        if (now < 400) then
            if (clk_tb'event and clk = '1' ) then
                inp_tb <= i;
                i = i + 1;
            end if;
        else
            wait;
        end if;
    end process;

    -- output verification
    process(clk_tb)
        variable out_ver: std_logic_vector(2 downto 0);
    begin
        if (now < 400) then
            if (clk'event and clk = '1') then
                out_ver := luts_ver(to_integer(unsigned(inp_tb)));
                assert out_tb = out_ver
                report "results is not expected at t = " & now'image
                severity failure
            end if;
        else
            assert false
            report "all good"
            severity note
            wait;
        end if;
    end process;
end architecture circuit;

