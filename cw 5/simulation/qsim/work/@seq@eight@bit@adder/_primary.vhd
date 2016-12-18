library verilog;
use verilog.vl_types.all;
entity SeqEightBitAdder is
    port(
        SW              : in     vl_logic_vector(15 downto 0);
        KEY0            : in     vl_logic;
        LEDR            : out    vl_logic_vector(8 downto 0)
    );
end SeqEightBitAdder;
