Library ieee;
use ieee.std_logic_1164.all;

entity OneBitAdder is
	port(
		A, B, CIN: IN std_logic;
		S, COUT: OUT std_logic
	);
end OneBitAdder;

architecture impl of OneBitAdder is
begin
	S <= A xor B xor CIN;
	COUT <= (A and B) or (A and CIN) or (B and CIN);
end impl;
		