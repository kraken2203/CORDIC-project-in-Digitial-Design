library verilog;
use verilog.vl_types.all;
entity rightshifter is
    generic(
        n               : integer := 4;
        i               : integer := 1
    );
    port(
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of i : constant is 1;
end rightshifter;
