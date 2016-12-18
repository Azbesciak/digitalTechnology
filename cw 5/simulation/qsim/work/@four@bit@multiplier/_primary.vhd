library verilog;
use verilog.vl_types.all;
entity FourBitMultiplier is
    port(
        SW              : in     vl_logic_vector(7 downto 0);
        KEY0            : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        LEDR            : out    vl_logic_vector(7 downto 0)
    );
end FourBitMultiplier;
