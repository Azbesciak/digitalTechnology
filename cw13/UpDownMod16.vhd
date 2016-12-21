library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UpDownMod16 is
	generic(
		MIN_COUNT : natural := 0;
		MAX_COUNT : natural := 15
	);

	port(
		clk, load, enable, up : in std_logic;
		toLoad: in integer range MIN_COUNT to MAX_COUNT;
		q : out integer range MIN_COUNT to MAX_COUNT;
		carry : out std_logic
	);
end entity;

architecture rtl of UpDownMod16 is
begin

	process (clk, load)
		variable   cnt: integer range MIN_COUNT to MAX_COUNT;
	begin
			if load = '1' then
				cnt := toLoad;
			elsif (rising_edge(clk) and enable = '1') then
				if up = '1' then
					if cnt = MAX_COUNT then
						carry <= '1';
					else carry <= '0';
					end if;
				cnt := cnt + 1;
				else
					if cnt = MIN_COUNT then
						carry <= '1';
					else carry <= '0';
					end if;
				cnt := cnt - 1;
				end if;
			end if;
		q <= cnt;
	end process;

end rtl;
