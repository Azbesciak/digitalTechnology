library ieee;
use ieee.std_logic_1164.all;

entity SeqOneBitAdder is
	port(
		A, B, CIN, CLK: IN std_logic;
		S, COUT: OUT std_logic
	);
end SeqOneBitAdder;

architecture impl of SeqOneBitAdder is
begin
	process(CLK)
		begin
			if (rising_edge(CLK)) then
				S <= A xor B xor CIN;
				COUT <= (A and B) or (A and CIN) or (B and CIN);
			end if;
		end process;
end impl;