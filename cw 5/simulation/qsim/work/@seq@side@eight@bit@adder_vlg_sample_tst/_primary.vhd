library verilog;
use verilog.vl_types.all;
entity SeqSideEightBitAdder_vlg_sample_tst is
    port(
        ADD             : in     vl_logic;
        KEY0            : in     vl_logic;
        SAVE            : in     vl_logic;
        SW              : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end SeqSideEightBitAdder_vlg_sample_tst;
