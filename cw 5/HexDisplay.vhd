library ieee;
use ieee.std_logic_1164.all;

entity HexDisplay is
	port(
		input: in std_logic_vector(3 downto 0);
		display: out std_logic_vector(6 downto 0)
	);
end HexDisplay;

architecture dis of HexDisplay is
begin
	with input select
		display <= "0000001" when "0000",
					  "0011111" when "0001",
					  "0100100" when "0010",
					  "0001100" when "0011",
					  "0011010" when "0100",
					  "1001000" when "0101",
					  "1000000" when "0110",
					  "0011101" when "0111",
					  "0000000" when "1000",
					  "0001000" when "1001",
					  "0010000" when "1010",
					  "1000011" when "1011",
					  "1100001" when "1100",
					  "0000110" when "1101",
					  "1100000" when "1110",
					  "1110000" when "1111",
					  "1111111" when others;
end dis;