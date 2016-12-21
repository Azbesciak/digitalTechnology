LIBRARY ieee;
use ieee.std_logic_1164.all;

entity first is
	port(
		SW: IN std_logic_vector(2 downto 0);
		LEDR: OUT std_logic_vector(2 downto 0)
	);
end first;

Architecture impl of first is
	begin	
		with sw select	
			LEDR <= "000" when "000",
					  "100" when "001",
					  "110" when "010",
					  "010" when "011",
					  "111" when "100",
					  "001" when "101",
					  "101" when "110",
					  "000" when others;
	end impl;