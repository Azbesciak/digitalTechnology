library ieee;
use ieee.std_logic_1164.all;

entity FourBitAdder is
	generic(WIDTH : integer := 4);
	port(
		A, B: IN std_logic_vector(WIDTH - 1 downto 0);
		S: OUT std_logic_vector(WIDTH - 1 downto 0);
		COUT: out std_logic
	);
end FourBitAdder;

architecture impl of FourBitAdder is
	component OneBitAdder is
		port(
		A, B, CIN: IN std_logic;
		S, COUT: OUT std_logic
		);
	end component;
	
	signal c: std_logic_vector(WIDTH downto 0);
	
	begin
		c(0)<= '0';
		cout <= c(WIDTH);
		
		SUM: for i in WIDTH - 1 downto 0 generate
			ad : oneBitAdder port map(
				a(i), b(i), c(i),	s(i), c(i + 1)
			);
		end generate;
	end;