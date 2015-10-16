library verilog;
use verilog.vl_types.all;
entity stage0 is
    port(
        Xin             : in     vl_logic_vector(15 downto 0);
        Yin             : in     vl_logic_vector(15 downto 0);
        Zin             : in     vl_logic_vector(15 downto 0);
        theta           : in     vl_logic_vector(17 downto 0);
        Xout            : out    vl_logic_vector(17 downto 0);
        Yout            : out    vl_logic_vector(17 downto 0);
        Zout            : out    vl_logic_vector(17 downto 0)
    );
end stage0;
