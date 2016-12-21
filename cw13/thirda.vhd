-- Quartus II VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity thirda is
	port(
		clk, enable : in std_logic;
		reset: buffer std_logic;
		q : out integer range 0 to 64
	);
end entity;

architecture rtl of thirda is
component binary_counter_mod_16 is
	port(
		clk, reset, enable : in std_logic;
		q : out integer range 0 to 15;
		carry: out std_logic
	);
	end component;
	
		signal carry : std_logic;
		signal   a, b: integer range 0 to 16;
begin

	coun1 :binary_counter_mod_16 port map(
		clk, reset, enable, a, carry
	);
	coun2 : binary_counter_mod_16 port map(
		carry, reset, enable, b
	);
	q <= b * 16 + a;
	process (a, b)
	begin 
		if b = 3 and a = 7 then
			reset <= '1';
		else reset <= '0';
		end if;
	end process;

end rtl;
