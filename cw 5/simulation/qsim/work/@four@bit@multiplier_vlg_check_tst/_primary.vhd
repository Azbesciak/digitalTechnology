library verilog;
use verilog.vl_types.all;
entity FourBitMultiplier_vlg_check_tst is
    port(
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        HEX4            : in     vl_logic_vector(6 downto 0);
        HEX5            : in     vl_logic_vector(6 downto 0);
        LEDR            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end FourBitMultiplier_vlg_check_tst;
