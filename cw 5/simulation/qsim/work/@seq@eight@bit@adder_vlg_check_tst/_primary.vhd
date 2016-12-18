library verilog;
use verilog.vl_types.all;
entity SeqEightBitAdder_vlg_check_tst is
    port(
        LEDR            : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end SeqEightBitAdder_vlg_check_tst;
