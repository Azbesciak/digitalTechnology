library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter_mod_16 is
	generic(
		MIN_COUNT : natural := 0;
		MAX_COUNT : natural := 15
	);

	port(
		clk, reset, enable : in std_logic;
		q : out integer range MIN_COUNT to MAX_COUNT;
		carry : out std_logic
	);
end entity;

architecture rtl of binary_counter_mod_16 is
begin

	process (clk, reset)
		variable   cnt: integer range MIN_COUNT to MAX_COUNT;
	begin
	
			if reset = '1' then
				-- Reset the counter to 0
				cnt := 0;
			elsif (rising_edge(clk) and enable = '1') then
					if cnt = MAX_COUNT then
						carry <= '1';
					else carry <= '0';
					end if;
				cnt := cnt + 1;
				
			end if;

		-- Output the current count
		q <= cnt;
	end process;

end rtl;
