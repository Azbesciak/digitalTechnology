library ieee;
use ieee.std_logic_1164.all;

entity SeqSideEightBitAdder is
	port(
		SW: IN std_logic_vector(17 downto 0); --sw17 save?, sw16 add?
		KEY0: IN std_logic;
		LEDR: out std_logic_vector(8 downto 0);
		HEX0, HEX1: OUT std_logic_vector(6 downto 0)
	);
end SeqSideEightBitAdder;

architecture impl of SeqSideEightBitAdder is
component OneBitAdder is
port(
	A, B, CIN: IN std_logic;
	S, COUT: OUT std_logic
);
end component;

component HexDisplay is
port(
	input: in std_logic_vector(3 downto 0);
	display: out std_logic_vector(6 downto 0)
);
end component;

signal c: std_logic_vector(8 downto 0);
signal reg: std_logic_vector(7 downto 0) := SW(15 downto 8);
signal bBuffor: std_logic_vector(7 downto 0) := SW(7 downto 0);
signal output: std_logic_vector(7 downto 0) := "00000000";
begin
	H0: HexDisplay port map(output(3 downto 0), Hex0(6 downto 0));
	H1: HexDisplay port map(output(7 downto 4), Hex1(6 downto 0));
	
	SUM: for i in 7 downto 0 generate
		ad : OneBitAdder port map(
			reg(i), bBuffor(i), c(i), output(i), c(i + 1)
		);
	end generate;
	c(0) <= not(SW(16));
	process (KEY0)
	begin
		if rising_edge(KEY0) then
			if SW(16) = '0' then  --add or sub
				for i in 7 downto 0 loop
					bBuffor(i) <= not(SW(i));
				end loop;
			else 
				for i in 7 downto 0 loop
					bBuffor(i) <= SW(i);
				end loop;
			end if;
			if SW(17) = '1' then --if save last solution
				reg(7 downto 0) <= output(7 downto 0);
			else
				reg(7 downto 0) <= SW(15 downto 8);
			end if;
		end if;
		LEDR(7 downto 0) <= output(7 downto 0);	
		LEDR(8) <= c(8);
	end process;
end;