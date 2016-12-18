library ieee;
use ieee.std_logic_1164.all;

entity SeqEightBitAdder is
    generic(WIDTH : integer := 8);
    port(
        SW: IN std_logic_vector(15 downto 0);
        KEY0: IN std_logic;
        LEDR: OUT std_logic_vector(8 downto 0)
    );
end SeqEightBitAdder;

architecture impl of SeqEightBitAdder is
	component OneBitAdder is
	port(
		A, B, CIN: IN std_logic;
		S, COUT: OUT std_logic
	);
	end component;
	
    signal c: std_logic_vector(8 downto 0);
	 signal outBuf: std_logic_vector(7 downto 0);
begin
    c(0)<= '0';
    SUM: for i in WIDTH - 1 downto 0 generate
        ad : OneBitAdder port map(
            SW(i), SW(i + 7), c(i), outBuf(i), c(i + 1) );
    end generate;
	 process(KEY0)
	 begin
		if rising_edge(KEY0) then
			LEDR(7 downto 0) <= outBuf(7 downto 0);
			LEDR(8) <= c(8);
		end if;
	 end process;
end;
