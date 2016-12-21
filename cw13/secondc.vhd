Library ieee;
use ieee.std_logic_1164.all;
--modulo 12 przerzutniki D
entity secondc is
	port(
		A ,B ,C ,D: buffer std_logic;
		CLK: in std_logic
	);
end secondc;

architecture mod12 of secondc is
	component dflipflop
		port (
			D, CLK, RES: IN std_logic;
			Q: OUT std_logic
		);
	end component;

	signal reset: std_logic;
begin

	CLR: dflipflop port map(
		(A and (B) and not(C) and (D)), not(CLK), '0', reset 
	);

	d3: dflipflop port map(
		not(A), not(B), reset , A
	);
	d2: dflipflop port map(
		not(B), not(C), reset, B
	);
	d1: dflipflop port map(
		not(C), not(D), reset, C
	);
	d0: dflipflop port map(
		not(D), CLK, reset, D
	);
	
end mod12;

Library ieee;
use ieee.std_logic_1164.all;

entity dflipflop is
	port (
		D, CLK, RES: IN std_logic;
		Q: OUT std_logic
	);
end dflipflop;

architecture impl of dflipflop is
begin
	process(CLK, RES)
	begin	
		if (RES = '1') then  Q <= '0';
		elsif rising_edge(CLK) then
			if (D = '0') then 
				Q <= '0';
			elsif D = '1' then 
				Q <= '1';
			end if;
		end if;
	end process;
end impl;
			
	
	