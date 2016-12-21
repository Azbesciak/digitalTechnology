Library ieee;
use ieee.std_logic_1164.all;

entity seconda is
	port(
		A: buffer std_logic;
		B: buffer std_logic;
		C: buffer std_logic;
		CLK: IN std_logic
	);
	end seconda;
	
	architecture impl of seconda is
		signal buf: std_logic_vector(2 downto 0);
		begin
			Task:process(CLK)
				begin	
					if rising_edge(CLK) then
						A <= not(A and not (not B and not C));
						B <= not(not(B and not C) and not(A and not C));
						C <= not(not(not A and C) and not(not A and B) and not(B and C));
						--(A, B, C) <= buf;
					end if;
				end process Task;
			end impl;