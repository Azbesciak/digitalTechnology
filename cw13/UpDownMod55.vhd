library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UpDownMod55 is
	port(
		clk, up: in std_logic;
		q : out integer range 0 to 63
	);
end entity;

architecture impl of UpDownMod55 is
component UpDownMod16 is
	port(
		clk, load, enable, up : in std_logic;
		toLoad: in integer range 0 to 15;
		q : out integer range 0 to 15;
		carry : out std_logic
	);
end component;

signal carry, load : std_logic;
signal enable : std_logic := '1';
signal a,b, al, bl : integer range 0 to 15;
begin
	counter1 : UpDownMod16 port map(
		clk, load, enable, up, al, a, carry
		);
	counter2 : UpDownMod16 port map(
		carry, load, enable, up, bl, b
	);
	
	process(a, b)
	begin
		if (a = 7 and b = 3 and up = '1') then
			load <= '1'; al <= 0; bl <= 0;
		elsif (a = 15 and b = 15 and up = '0') then
			load <= '1'; al <= 6; bl <= 3;
		else 
			load <= '0';
		end if;
	end process;
	q <= b * 16 + a;
end impl;
	