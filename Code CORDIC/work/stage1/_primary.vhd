library verilog;
use verilog.vl_types.all;
entity stage1 is
    generic(
        stage           : integer := 1
    );
    port(
        Xin             : in     vl_logic_vector(17 downto 0);
        Yin             : in     vl_logic_vector(17 downto 0);
        Zin             : in     vl_logic_vector(17 downto 0);
        theta           : in     vl_logic_vector(17 downto 0);
        Xout            : out    vl_logic_vector(17 downto 0);
        Yout            : out    vl_logic_vector(17 downto 0);
        Zout            : out    vl_logic_vector(17 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of stage : constant is 1;
end stage1;
