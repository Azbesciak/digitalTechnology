library verilog;
use verilog.vl_types.all;
entity SeqSideEightBitAdder is
    port(
        SW              : in     vl_logic_vector(15 downto 0);
        KEY0            : in     vl_logic;
        SAVE            : in     vl_logic;
        ADD             : in     vl_logic;
        LEDR            : out    vl_logic_vector(8 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0)
    );
end SeqSideEightBitAdder;
